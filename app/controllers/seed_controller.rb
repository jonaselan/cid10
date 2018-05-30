class SeedController < ApplicationController
  def index
    xml = Hash.from_xml(File.open("CID10.xml", "r:UTF-8"))
    return fail_message if all_datatable_empty?

    # rollback nas operações se houver algum erro
    ActiveRecord::Base.transaction do
      cid10 = Cid10.create(version: xml['cid10']['versao'])
      xml['cid10']['capitulo'].each do |chapter|
        cap = Chapter.create(name: chapter['nome'], name50: chapter['nome50'],
                             numcap: chapter['numcap'], codcap: chapter['codcap'],
                             roman: chapter['romano'], initial: chapter['inicial'],
                             final: chapter['final'], cid10: cid10)
          if chapter['grupo']
            chapter['grupo'].each do |group|
                gro = Group.create(name: group['nome'], name50: group['nome50'],
                                   codgroup: group['codgrupo'], initial: group['inicial'],
                                   final: group['final'], chapter: cap)

                if group['categoria']
                  if group['categoria'].kind_of?(Array)
                    group['categoria'].each do |category|
                      cat = Category.create(name: category['nome'], name50: category['nome50'], restriction_id: restriction(category['restricoes']),
                                            codcat: category['codcat'], ehsubcat: category['ehsubcat'],
                                            classification_id: classification(category['duplaclassificacao']), group: gro)
                        if category['subcategoria']
                          category['subcategoria'].each do |subcategory|
                            Subcategory.create(name: subcategory['nome'], name50: subcategory['nome50'], codsubcat: subcategory['codsubcat'],
                                               restriction_id: restriction(subcategory['restricoes']),
                                               classification_id: classification(subcategory['duplaclassificacao']), category: cat)
                            end
                          end
                        end
                  else
                    # caso tenha somente uma categoria
                      Category.create(name: group['categoria']['nome'], name50: group['categoria']['nome50'],
                                      codcat: group['categoria']['codcat'], restriction_id: restriction(group['categoria']['restricoes']),
                                      ehsubcat: group['categoria']['ehsubcat'], group: gro,
                                      classification_id: classification(group['categoria']['duplaclassificacao']))
                  end
                end
            end
          end
      end
    end
    # render json: xml
    sucess_message
  end

  private

  def all_datatable_empty?
    Cid10.exists? || Chapter.exists? || Group.exists? ||
    Category.exists? || Subcategory.exists?
  end

  def fail_message
    render json: { message: 'Make sure all your tables are empty' }
  end

  def sucess_message
    render json: { message: 'Tables populated through XML CID10.xml completed' }
  end

  def restriction(type)
    return nil unless type

    if type['causaobito'] === "nao"
        return Restriction.first.id
    elsif type['sexo'] === "apenas_homens"
        return Restriction.second.id
    elsif type['sexo'] === "apenas_mulheres"
        return Restriction.third.id
    end
  end

  def classification(type)
    return nil unless type

    unless type['referencia']
      if type['tipo'] === "cruz"
        return Classification.first.id
      elsif type['tipo'] === "asterisco"
        return Classification.second.id
      end
    else
      return Classification.create(estate: type['tipo'], reference: type['referencia'].first).id
    end
  end

end
