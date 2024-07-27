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

Job.destroy_all
User.destroy_all

puts "Destroying all jobs..."
puts "Destroying all users..."

categories = ['City Hall', 'Hospital','Dentist', 'Doctor Visit', 'Apartment Search', 'Document Translation', 'Other']

description = ["Clean the house", "Help me with speaking to the doctor in English", "I need help with my apartment search", "My tooth hurts", "I need help at the city office for MyNumber!"]

20.times do |i|
  user = User.create!(email:"user-#{i+1}@example.com", password:"123456")
  Job.create!(job_category: categories.sample, user: user, date: Faker::Date.between(from: Date.today, to: '2025-12-31'), price: rand(100..100000), urgency: rand(1..5), address: Faker::Address.city, description: description.sample)
end

puts "Added jobs!"
puts "Added users!"

puts "Created #{Job.count} jobs!"
