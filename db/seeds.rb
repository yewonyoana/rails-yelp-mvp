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

puts "Cleaning the DB..."
Restaurant.destroy_all

CATEGORIES = ['Chinese', 'Italian', 'Japanese', 'French', 'Belgian']

def get_category(name)
  last_word = name.split.last.downcase
  CATEGORIES.include?(last_word) ? last_word : CATEGORIES.sample
end


# puts "Creating #{CHEFS.count} Restaurants..."
5.times do
  restaurant_name = Faker::Restaurant.unique.name
  Restaurant.create!(
    name: "#{restaurant_name}",
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: get_category(restaurant_name),
    # chef_name: name
  )
end
puts "...Created #{Restaurant.count} restaurants"
