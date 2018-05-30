json.diseases @diseases do |disease|
  json.id        disease.id
  json.name      disease.name
  json.name50    disease.name50
  json.ehsubcat  disease.ehsubcat
  json.chapter   disease.group.chapter.name
  json.subcategories disease.subcategories do |subcategory|
    json.name               subcategory.id
    json.name50             subcategory.name50
    json.codsubcat          subcategory.codsubcat
    json.restriction_id     subcategory.restriction_id
    json.classification_id  subcategory.classification_id
  end
  json.group do
    json.name      disease.group.id
    json.name      disease.group.name
    json.name50    disease.group.name50
    json.codgroup  disease.group.codgroup
    json.initial   disease.group.initial
    json.final     disease.group.final
   end
end
