# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: ENV['EMAIL'], password: ENV['PASSWORD'], password_confirmation: ENV['PASSWORD'])

post = Post.new(content: Faker::Lorem.sentences);
post.image.attach(io: File.open("lib/assets/images/seeds/seed_kirby.jpg"), filename: 'seed_kirby.jpg')
post.save!

