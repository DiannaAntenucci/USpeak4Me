# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
Booking.destroy_all
Job.destroy_all
User.destroy_all

puts "Destroying all jobs..."
puts "Destroying all users..."

categories_descriptions = {
  'City Hall' => "I need help at the city office for MyNumber!",
  'Hospital' => "I hava a bad headache and I don't know why",
  'Dentist' => "My tooth hurts",
  'Apartment Search' => "I need to find a sexy flat",
  'Document Translation' => "I need help with my essay translation",
  'Other' => "I need someone to see Hanabi with me"
}

address = ["Asakusa", "Shibuya", "Odaiba", "Shinjuku", "Ginza", "Meguro"]

20.times do |i|
  user = User.create!(email: "user-#{i + 1}@example.com", password: "123456")
  category, description = categories_descriptions.to_a.sample
  Job.create!(
    job_category: category,
    user: user,
    date: Faker::Date.between(from: Date.today, to: '2025-12-31'),
    price: rand(10..100) * 500,
    urgency: rand(1..5),
    address: address.sample,
    description: description
  )
end

puts "Created #{User.count} users!"
puts "Created #{Job.count} jobs!"
