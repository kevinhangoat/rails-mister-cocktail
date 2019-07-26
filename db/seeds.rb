# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.delete_all
Ingredient.delete_all
Cocktail.delete_all

ingredients_url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_json = open(ingredients_url).read
ingredients = JSON.parse(ingredients_json)
ingredients["drinks"].each do |ele|
  Ingredient.create(name: ele["strIngredient1"])
end
puts "ingredients done"

cocktails_url = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"
cocktails_json = open(cocktails_url).read
cocktails = JSON.parse(cocktails_json)[0..30]
puts "cocktail url done"

cocktails_image_url = "https://gist.githubusercontent.com/renandanton/8d99dab65bf9fb5b4465ded7ab73a7df/raw/2c5e0480bd239f76b055bb09f236f365e1530634/cocktails.json"
cocktails_image_json = open(cocktails_image_url).read
cocktails_image = JSON.parse(cocktails_image_json)["cocktails"]
puts "cocktail image-url done"
puts cocktails_image


cocktails.each_with_index do |cocktail, index|
  puts cocktails_image[index]["image"].to_s
  c = Cocktail.create!(name: cocktail["name"], image: cocktails_image[index]["image"].to_s)
  cocktail["ingredients"].each do |ingredient|
    if ingredient["ingredient"]
      i = Ingredient.find_or_create_by(name: ingredient["ingredient"])
      d = Dose.create(description: ingredient["amount"].to_s + " " + ingredient["unit"], cocktail: c, ingredient: i)
      puts "added #{d.description} of #{i.name} to #{c.name}"
    end
  end
end

