json.id        @disease.id
json.name      @disease.name
json.name50    @disease.name50
json.ehsubcat  @disease.ehsubcat
json.group do
   json.name      @disease.group.id
   json.name50    @disease.group.name50
   json.codgroup  @disease.group.codgroup
   json.initial   @disease.group.initial
   json.final     @disease.group.final
 end
