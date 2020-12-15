# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting old instances"
Comment.destroy_all
User.destroy_all

puts "creating new user"

user = User.new(email: "das@das.de", password: "123123", password_confirmation: "123123")
user.save

puts user.save
puts "creating comments"
