# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times do
#   username = Faker::Name.first_name
#   User.create({username: username,
#                email: Faker::Internet.free_email(username),
#                password: 'qwerty'
#               })
# end

tags = ["adventure", "shop", "eat", "hike", "life", "beach", "mountain"]

tags.each do |tag|
  Tag.create(name: tag)
end
