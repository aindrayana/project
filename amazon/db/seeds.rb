# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  Product.create({title: Faker::Commerce.product_name,
                  price: Faker::Commerce.price,
                  desc: Faker::Lorem.sentence
                  })
end
