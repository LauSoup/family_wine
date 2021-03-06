# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

p "Delete all data"

Favorite.destroy_all
WineConso.destroy_all
Wine.destroy_all

ConsoTag.destroy_all
Price.destroy_all
Region.destroy_all
User.destroy_all


p "Creating user admin"

user = User.create(pseudo: "admin", email: "admin@admin.com", password: "password")

p "Creating regions"

regions = ["Alsace", "Armagnac et Cognac", "Beaujolais et Lyonnais", "Bordeaux", "Bourgogne", "Champagne", "Corse", "Jura", "Languedoc", "Lorraine", "Poitou-Charentes", "Provence", "Roussillon", "Savoie et Bugey", "Sud-ouest", "Vallée de la Loire", "Vallée du Rhône"]

regions.each do |region|
  Region.create(region_name: region)
end

p "Creating prices forks"

prices = ["Gagne au loto", "Abordable", "Si tu veux te faire plaisir", "Vraiment pas cher"]

prices.each do |price|
  Price.create(price_fork: price)
end

p "Creating Conso tags"

tags = ["Parfait pour l'apéro", "Léger passe-partout", "Puissant", "Sucré" ]

tags.each do |tag| 
  ConsoTag.create(conso_name: tag)
end

p "Creating wines"
countries = ["France", "Italie", "Espagne", "Etats-Unis", "Argentine", "Australie", "Chili", "Allemagne", "Afrique du Sud", "Chine"]
categories = ["Rouge", "Blanc", "Champagne / Mousseux", "Rosé", "Autre vin", "Autre alcool"]

img = "https://source.unsplash.com/3uJt73tr4hI"
file = URI.open(img)


name = "L'exemple"
description = "Je suis juste là pour montrer l'exemple"
user = User.first
price = Price.random
region = Region.random
country = "France"
category = categories.sample

wine = Wine.create(
  name: name,
  description: description,
  user_id: user.id,
  price_id: price.id,
  region_id: region.id,
  country: country,
  category: category
)
wine.photo.attach(io: File.open('app/assets/images/glasses.png'), filename: 'glasses.png', content_type: 'image/png')





# 10.times do
#   name = "Vin #{(1..100).to_a.sample}"
#   description = "Blablablablablablablablabla"
#   user = User.first
#   price = Price.random
#   region = Region.random
#   country = countries.sample
#   category = categories.sample

#   wine = Wine.create(
#     name: name,
#     description: description,
#     user_id: user.id,
#     price_id: price.id,
#     region_id: region.id,
#     country: country,
#     category: category
#   )
#   wine.photo.attach(io: File.open('app/assets/images/glasses.png'), filename: 'glasses.png', content_type: 'image/png')
# end

# p "Creating wine conso"

#   wines = Wine.all
#   wines.each do |wine|
#     (1..3).to_a.sample.times do
#       WineConso.create(wine_id: wine.id, conso_tag_id: ConsoTag.random.id)
#     end
#   end
