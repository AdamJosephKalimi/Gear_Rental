# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.delete_all
Booking.delete_all
Gear.delete_all
User.delete_all

categories = ["mountain bike", "road bike", "windsurf sails", "windsurf board", "kite board", "skis" ]

20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Number.number(10),
    username: Faker::GameOfThrones.unique.character,
    phone_number: Faker::PhoneNumber.phone_number
    )
  user.save!
end


20.times do
  gear = Gear.new(
    category: categories.sample,
    name: Faker::Vehicle.manufacture,
    description: Faker::MostInterestingManInTheWorld.quote,
    price: Faker::Number.between(20, 88),
    size: Faker::Number.number(3),
    address: Faker::Address.street_address,
    user_id: User.all.sample.id,

    )
  gear.save!
end



20.times do
  booking = Booking.new(
    user_id: User.all.sample.id,
    gear_id: Gear.all.sample.id,
    start_date: Faker::Date.between(100.days.ago, Date.today),
    end_date: Faker::Date.between(99.days.ago, Date.today)
    )
  booking.save!
end


20.times do
  review = Review.new(
    user_content: Faker::RickAndMorty.quote,
    gear_content: Faker::StarWars.quote,
    booking_id: Booking.all.sample.id
    )
  review.save!
end
