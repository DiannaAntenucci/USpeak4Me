# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create(email:"rena.wxy@gmail.com", password:"123456")

20.times do |i|
  user = User.create(email:"user-#{i+1}@example.com", password:"123456")
  Job.create!( job_category: "Cleaning", user: user, date: Time.now, price: 100, urgency: 1, address: "123 Main St", description: "Clean the house")
end
