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
  details: 'good at any moment, from breakfast to night.'
)

orange_bourbon = Cocktail.create!(
  name: 'orange bourbon',
  directions: 'put some orange in bourbon and drink that.',
  details: 'perfect for a friday night.'
)

one_part_gin = Dose.new(description: '1 part')
one_part_gin.cocktail = gintoto
one_part_gin.ingredient = Ingredient.find_by(name: 'gin')
one_part_gin.save!

one_part_lemon = Dose.new(description: '1 part')
one_part_lemon.cocktail = gintoto
one_part_lemon.ingredient = Ingredient.find_by(name: 'lemon juice')
one_part_lemon.save!

two_part_lemon = Dose.new(description: '2 parts')
two_part_lemon.cocktail = gintoto
two_part_lemon.ingredient = Ingredient.find_by(name: 'soda tonic')
two_part_lemon.save!


puts 'cool cool'
