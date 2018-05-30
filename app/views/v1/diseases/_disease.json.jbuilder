json.id        disease.id
json.name      disease.name
json.name50    disease.name50
json.ehsubcat  disease.ehsubcat if disease.ehsubcat
json.chapter   disease.group.chapter.name
json.subcategories disease.subcategories do |subcategory|
  json.name            subcategory.name
  json.name50          subcategory.name50
  json.codsubcat       subcategory.codsubcat
  if subcategory.restriction
    json.restriction  do
      json.type         subcategory.restriction.estate
      json.description  subcategory.restriction.description
    end
  end
  if subcategory.classification
    json.classification  do
      json.type       subcategory.classification.estate
      json.reference  subcategory.classification.reference if subcategory.classification.reference
    end
  end
end
json.group do
  json.name      disease.group.name
  json.name50    disease.group.name50
  json.codgroup  disease.group.codgroup
  json.initial   disease.group.initial
  json.final     disease.group.final
 end
