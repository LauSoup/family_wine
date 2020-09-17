# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Delete all data"

Favorite.destroy_all
WineConso.destroy_all
Wine.destroy_all

ConsoTag.destroy_all
Price.destroy_all
Region.destroy_all
User.destroy_all


p "Creating user admin"

user = User.create(email: "admin@admin.com", password: "password")

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

tags = ["Apéro", "Viande rouge", "Viande blanche", "Poissons", "Coquillages", "Charcuterie", "Léger passe-partout", "Puissant" ]

tags.each do |tag| 
  ConsoTag.create(conso_name: tag)
end

p "Creating wines"
countries = ["France", "Italie", "Espagne", "Etats-Unis", "Argentine", "Australie", "Chili", "Allemagne", "Afrique du Sud", "Chine"]


10.times do
  name = "Vin #{(1..100).to_a.sample}"
  description = "Blablablablablablablablabla"
  user = User.first
  price = Price.random
  region = Region.random
  country = countries.sample

  Wine.create(
    name: name,
    description: description,
    user_id: user.id,
    price_id: price.id,
    region_id: region.id,
    country: country
  )
end

p "Creating wine conso"

  wines = Wine.all
  wines.each do |wine|
    (1..3).to_a.sample.times do
      WineConso.create(wine_id: wine.id, conso_tag_id: ConsoTag.random.id)
    end
  end
