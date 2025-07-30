puts "🌱 Seeding vendors..."

# Create vendors
elegant_moments = Vendor.create(name: "Elegant Moments Photography", established_year: 2015)
garden_party = Vendor.create(name: "Garden Party Catering", established_year: 2012)
blooming_affairs = Vendor.create(name: "Blooming Affairs Florist", established_year: 2018)
sweet_dreams = Vendor.create(name: "Sweet Dreams Bakery", established_year: 2010)
harmony_music = Vendor.create(name: "Harmony Music Services", established_year: 2020)

puts "🌱 Seeding weddings..."

# Create weddings
smith_johnson = Wedding.create(couple_names: "Smith-Johnson Wedding")
garcia_lee = Wedding.create(couple_names: "Garcia-Lee Wedding")
brown_wilson = Wedding.create(couple_names: "Brown-Wilson Wedding")
martinez_kim = Wedding.create(couple_names: "Martinez-Kim Wedding")

puts "🌱 Seeding complete!"

# TODO: Create booking records here
# Remember to use the vendor and wedding instances created above
# Example service types: "Photography", "Catering", "Flowers", "Cake", "Music", "Venue"
# Example costs: 2500, 4500, 800, 1200, 1800, 3000
# Example booking dates: "2024-06-15", "2024-07-20", "2024-08-10", "2024-09-05"
