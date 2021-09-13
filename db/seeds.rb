# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(name: "Vapers")
Category.create(name: "Liquids")
Category.create(name: "Accessories")

User.create(username: "carlos3434",password:'12345678')

Item.create(name:'test name', price:'0.5', brand: 'acme', warantine_time: '2', strength:'test', flavor:'dulce', size:'5',category_id:1,user_id:1)
Item.create(name:'test name', price:'0.5', brand: 'acme', warantine_time: '2', strength:'test', flavor:'dulce', size:'5',category_id:2,user_id:1)
Item.create(name:'test name', price:'0.5', brand: 'acme', warantine_time: '2', strength:'test', flavor:'dulce', size:'5',category_id:3,user_id:1)

#10.times do |i|
#  Item.create(name:'test name', price:'0.5', brand: 'acme', warantine_time: '2', strength:'test', flavor:'dulce', size:'5',category_id:1,user_id:1)
  #category:Category.find(1)
#end

#10.times do |i|
#  Item.create(name:'', price:'', brand: '', warantine_time: '', strength:'', flavor:'', size:'',category_id:2,user_id:1)
#end

#10.times do |i|
#  Item.create(name:'', price:'', brand: '', warantine_time: '', strength:'', flavor:'', size:'',category_id:3,user_id:1)
#end