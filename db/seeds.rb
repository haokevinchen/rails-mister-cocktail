# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

URL = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'.freeze

puts 'Truncate all records in db...'
Ingredient.destroy_all
Cocktail.destroy_all

# INGREDIENTS
puts 'Get JSON data'
serialized_data = URI.parse(URL).read
drinks = JSON.parse(serialized_data)['drinks']

drinks.each do |drink|
  Ingredient.create!(name: drink['strIngredient1'])
end

puts "Created #{Ingredient.count} ingredient(s)"

# COCKTAILS
Cocktail.create!(name: 'Martini')
Cocktail.create!(name: 'Bloody Mary')
Cocktail.create!(name: 'Margarita')
Cocktail.create!(name: 'Old Fashioned')
Cocktail.create!(name: 'Mojito')

puts "Created #{Cocktail.count} cocktail(s)"

puts 'Finished'
