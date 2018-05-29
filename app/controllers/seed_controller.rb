class SeedController < ApplicationController
  def index
    xml = Hash.from_xml(File.open("CID10.xml", "r:UTF-8"))
    return fail_message if all_datatable_empty?

    # só escuta todas as operações se tudo der certo
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
                                            codcat: category['codcat'], ehsubcat: category['ehsubcat'], group: gro)
                        if category['subcategoria']
                          category['subcategoria'].each do |subcategory|
                            Subcategory.create(name: subcategory['nome'], name50: subcategory['nome50'], codsubcat: subcategory['codsubcat'],
                                               restriction_id: restriction(subcategory['restricoes']), category: cat)
                            end
                          end
                        end
                  else
                    # caso tenha somente uma categoria
                      Category.create(name: group['categoria']['nome'].first, name50: group['categoria']['nome50'].first,
                                      codcat: group['categoria']['codcat'].first, restriction_id: restriction(group['categoria']['restricoes']),
                                      ehsubcat: group['categoria']['ehsubcat'].first, group: gro)
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
    render json: { menssagem: 'Certifique-se que todas as suas tabelas estejam vazias' }
  end

  def sucess_message
    render json: { menssagem: 'Tabelas preenchidas, a partir do XML Cid10.xml concluída' }
  end

  def restriction(type)
    return nil unless type
    if type['causaobito'] === "nao"
        return 1
    elsif type['sexo'] === "apenas_homens"
        return 2
    elsif type['sexo'] === "apenas_mulheres"
        return 3
    end
  end
end
