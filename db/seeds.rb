# populating the db
puts 'cleaning the db'
Ingredient.destroy_all

puts 'creating the db'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized = open(url).read
data = JSON.parse(serialized)
data['drinks'].each do |d|
  Ingredient.create(name: d['strIngredient1'])
end
