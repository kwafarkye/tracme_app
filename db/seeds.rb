# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "Kwaku Farkye", email: "kwafarkye@gmail.com", password: "15player", password_confirmation: "15player", admin: "true")
User.create(name: "Ken Ugo", email: "ken.ugo32@gmail.com", password: "", password_confirmation: "", admin: "true")