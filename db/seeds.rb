# populating the db
puts 'cleaning the db'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts 'creating the db'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized = open(url).read
data = JSON.parse(serialized)
data['drinks'].each do |d|
  Ingredient.create(name: d['strIngredient1'].downcase)
end

Ingredient.create(name: "soda tonic")
Ingredient.create(name: "coconut cream")
Ingredient.create(name: "pineapple")

gintoto = Cocktail.create!(
  name: 'gin toto',
  directions: 'some gin, some tonic, some ice, some lemon.',
  details: 'really good.'
  )
orange_bourbon = Cocktail.create!(
  name: 'orange bourbon',
  directions: 'put some orange in bourbon and drink that.',
  details: 'really good'
  )

puts 'cool cool'
