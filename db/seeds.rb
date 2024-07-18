# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed data for cities
City.create([
  {
    city_name: 'Vannes',
    price_per_sqm_livable: 3815,
    price_per_sqm_land: 763,
    price_per_sqm_rental: 13
  },
  {
    city_name: 'Villejuif',
    price_per_sqm_livable: 6409,
    price_per_sqm_land: 1282,
    price_per_sqm_rental: 22
  }
])

# Seed data for properties
Property.create([
  {
    city_id: 1,
    street_number: 55,
    street_name: 'Avenue de la Marne',
    zipcode: 56000,
    nb_dwelling: 1,
    area_sqm_land: 516,
    area_sqm_livable: 147,
    floor_area_ratio: 0.23, # Assuming percentage is converted to a float
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: 2,
    nb_rooms_per_dwelling: 4,
    energy_class: 'G',
    project_id: nil,
    latitude: nil,
    longitude: nil
  },
  {
    city_id: 2,
    street_number: 87,
    street_name: 'Avenue Paul Vaillant-couturier',
    zipcode: 94800,
    nb_dwelling: 3,
    area_sqm_land: 325,
    area_sqm_livable: 150,
    floor_area_ratio: 0.77, # Assuming percentage is converted to a float
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: 3,
    nb_rooms_per_dwelling: 6,
    energy_class: 'G',
    project_id: nil,
    latitude: nil,
    longitude: nil
  },
  {
    city_id: 2,
    street_number: 85,
    street_name: 'Avenue Paul Vaillant-couturier',
    zipcode: 94800,
    nb_dwelling: 1,
    area_sqm_land: 253,
    area_sqm_livable: 90,
    floor_area_ratio: 0.58, # Assuming percentage is converted to a float
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: 2,
    nb_rooms_per_dwelling: 4,
    energy_class: 'G',
    project_id: nil,
    latitude: nil,
    longitude: nil
  },
  {
    city_id: 2,
    street_number: 83,
    street_name: 'Avenue Paul Vaillant-couturier',
    zipcode: 94800,
    nb_dwelling: nil,  # Assuming missing value
    area_sqm_land: 252,
    area_sqm_livable: nil,  # Assuming missing value
    floor_area_ratio: 0.20, # Assuming percentage is converted to a float
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: nil,  # Assuming missing value
    nb_rooms_per_dwelling: nil,  # Assuming missing value
    energy_class: 'G',
    project_id: nil,
    latitude: nil,
    longitude: nil
  },
  {
    city_id: 2,
    street_number: 4,
    street_name: 'Rue Griffuelhes',
    zipcode: 94800,
    nb_dwelling: 1,
    area_sqm_land: 252,
    area_sqm_livable: 78,
    floor_area_ratio: 0.15, # Assuming percentage is converted to a float
    year_construction: 1945,
    building_zone: 'residential',
    density_area: 'mid',
    building_height_floors: 1,
    nb_rooms_per_dwelling: 2,
    energy_class: 'G',
    project_id: nil,
    latitude: nil,
    longitude: nil
  }
])

# Seed data for regulations
Regulation.create([
  {
    city_id: 1,
    floor_area_ratio: 0.40, # Assuming percentage is converted to a float
    building_height: 3,
    housing_social: 0.20, # Assuming percentage is converted to a float
    housing_affordable: nil, # Assuming missing value
    housing_market_rate: 0.80 # Assuming percentage is converted to a float
  },
  {
    city_id: 2,
    floor_area_ratio: 0.50, # Assuming percentage is converted to a float
    building_height: 5,
    housing_social: 0.30, # Assuming percentage is converted to a float
    housing_affordable: nil, # Assuming missing value
    housing_market_rate: 0.70 # Assuming percentage is converted to a float
  }
])

puts "Cities, Properties, and Regulations seeded successfully!"
