# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Category.destroy_all

category_list = [
  { name: "中式料理" },
  { name: "日本料理" },
  { name: "義大利料理" },
  { name: "墨西哥料理" },
  { name: "素食料理" },
  { name: "美式料理" },
  { name: "複合式料理" }
]

category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category created!"
puts "now you have #{Category.count} categories data"

Restaurant.destroy_all

500.times do |i|
  Restaurant.create!(name: FFaker::Name.first_name,
    opening_hours: FFaker::Time.datetime,
    tel: FFaker::PhoneNumber.short_phone_number,
    address: FFaker::Address.street_address,
    description: FFaker::Lorem.paragraph,
    category: Category.all.sample
  )
end
puts "have created fake restaurants"
puts "now you have #{Restaurant.count} restaurants data"

User.destroy_all

20.times do |i|
  user_name = FFaker::Name.first_name
  User.create!(
    name: user_name,
    email: "#{user_name}@example.com",
    password: "12345678"
  )
end
puts "have created fake users"
puts "now you have #{User.count} users data"

Commet.destroy_all

Restaurant.all.each do |restaurant|
  3.times do |i|
    restaurant.commets.create!(
      content: FFaker::Lorem.sentence,
      user: User.all.sample
    )
  end
end
puts "have created fake comments"
puts "now you have #{Commet.count} comment data"

User.create(email: "admin@restaurant.com", password: "12345678", role: "admin", name: "Admin")
puts "Default admin created!"
