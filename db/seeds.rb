# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


FidelityProgram.destroy_all
puts "All programs deleted!"

User.destroy_all
puts "All users deleted!"

merchant = User.create!(email: "msouvann1@gmail.com", password: "testtest", password_confirmation: "testtest", role: "merchant")
puts "merchant créé"

fidelity_one = FidelityProgram.create!(name: "test", points_per_euro: 1, user: merchant)
puts "Programme test créé"

puts "Done! #{FidelityProgram.count} programmes créés!"

customer_one = User.create!(email: "msouvann2@gmail.com", password: "testtest", password_confirmation: "testtest", role: "customer")
puts "Customer one créé"

inscription_one = Inscription.create!(user_id: customer_one.id, fidelity_program_id: fidelity_one.id)
puts "Inscription one créé"

customer_two = User.create!(email: "msouvann3@gmail.com", password: "testtest", password_confirmation: "testtest", role: "customer")
puts "Customer two créé"

inscription_two = Inscription.create!(user_id: customer_two.id, fidelity_program_id: fidelity_one.id)
puts "Inscription one créé"

puts "Done! All créés!"
