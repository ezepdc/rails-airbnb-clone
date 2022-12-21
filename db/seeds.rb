require "open-uri"
require "faker"

puts "Cleaning database..."

User.destroy_all
Booking.destroy_all
Flat.destroy_all

puts "Creating..."

user1 = User.create(
  first_name: "Ana",
  email: "ana@gmail.com",
  password: "Aribnb+22"
)
file = File.open(Rails.root.join("app/assets/images/10.jpg"))
user1.avatar.attach(io: file, filename: "photo1.jpg")
puts "User with id: #{user1.id} has been created"

user2 = User.create(
  first_name: "Vidinha",
  email: "vidinha@gmail.com",
  password: "Aribnb+22"
)
file = File.open("app/assets/images/8.jpg")
user2.avatar.attach(io: file, filename: "photo2.jpg")
puts "User with id: #{user2.id} has been created"

user3 = User.create(
  first_name: "Rosalia",
  email: "rosalia@gmail.com",
  password: "Aribnb+22"
)
file = File.open("app/assets/images/79.jpg")
user3.avatar.attach(io: file, filename: "photo3.jpg")
puts "User with id: #{user3.id} has been created"

10.times do |index|
  index += 1

  flat = Flat.create!(
    title: Faker::Mountain.name,
    city: Faker::Address.city,
    rating: rand(1..5),
    description: Faker::Lorem.paragraph(sentence_count: 1),
    bedrooms: rand(1..8),
    number_of_guests: rand(1..10),
    price_per_night: rand(25..170),
    user_id: rand(1...3),
    address: Faker::Address.country
  )
  file = URI.open('https://loremflickr.com/400/400/house,home')
  flat.photo.attach(io: file, filename: "photo#{index}.jpg")
  puts "Flat with id: #{flat.id} has been created"
end

puts "Finished!"
