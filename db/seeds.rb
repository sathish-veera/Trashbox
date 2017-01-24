# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Item.create(item_code: 001, item_name: "Books", unit_price: 5)
  Item.create(item_code: 002, item_name: "Computers", unit_price: 30)
  Item.create(item_code: 003, item_name: "Glasses", unit_price: 3)


   User.create! do |r|
	r.email      = 'demo@trashbox.com'
	r.password   = 'demo@123'
   end

   User.create! do |r|
	r.email      = 'admin@trashbox.com'
	r.password   = 'admin@123'
	r.is_admin = true
   end