# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.delete_all
Item.delete_all
User.delete_all

2.times do
  User.create(wechat_name: Faker::DumbAndDumber.actor, wechat_id: Faker::IDNumber.invalid, description: Faker::DumbAndDumber.quote)
end

User.all.each do |user|
  2.times do
    Item.create(user: user, name: Faker::DumbAndDumber.actor, description: Faker::DumbAndDumber.quote, availability: [false,true].sample ,price: Faker::Number.number(3), sizing: Faker::Number.between(1, 10))
  end
end


User.all.each do |u|
  2.times do
    Booking.create(date: Date.today, user_id: u.id, item_id: Item.all.sample.id)
  end
end
