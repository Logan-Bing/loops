# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
merchant = User.create!()

fidelity_one = FidelityProgram.create!(name: "test", points_per_euro: 1, user: merchant)
puts "Programme test créé"

puts "Done! #{FidelityProgram.count} programmes créés!"

customer_one = User.create!(name: "Michael", phone_number: "0123456789", role: "customer")
puts "Customer Michael créé"

customer_two = User.create!(name: "Logan", phone_number: "0123456987", role: "customer")
puts "Customer Logan créé"

puts "Done! #{User.count} clients créés!"
