# Suggested Solution

Below are the suggested solutions for this code challenge.

## Migration

```ruby
class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :service_type
      t.integer :cost
      t.string :booking_date
      t.references :vendor, null: false, foreign_key: true
      t.references :wedding, null: false, foreign_key: true
    end
  end
end
```

## Models with Associations and Methods

### `app/models/vendor.rb`

```ruby
class Vendor < ActiveRecord::Base
  has_many :bookings
  has_many :weddings, through: :bookings

  def create_booking(wedding, service_type, cost, booking_date)
    # Basic validation for date format
    return nil unless booking_date.match?(/\A\d{4}-\d{2}-\d{2}\z/)

    Booking.create(
      vendor: self,
      wedding: wedding,
      service_type: service_type,
      cost: cost,
      booking_date: booking_date
    )
  end

  def self.most_established
    order(:established_year).first
  end

  def total_revenue
    bookings.sum(:cost)
  end
end
```

### `app/models/wedding.rb`

```ruby
class Wedding < ActiveRecord::Base
  has_many :bookings
  has_many :vendors, through: :bookings

  def booked_service?(service_type)
    bookings.exists?(service_type: service_type)
  end

  def total_budget
    bookings.sum(:cost)
  end

  def reschedule_booking(booking, new_date)
    return nil unless bookings.include?(booking)
    return nil unless new_date.match?(/\A\d{4}-\d{2}-\d{2}\z/)

    booking.update(booking_date: new_date)
    booking
  end
end
```

### `app/models/booking.rb`

```ruby
class Booking < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :wedding

  def service_details
    "#{wedding.couple_names} booked #{service_type} ($#{cost}) with #{vendor.name} on #{booking_date}"
  end

  def self.expensive_bookings
    where("cost > ?", 1000)
  end
end
```

## Sample Seed Data (addition to seeds.rb)

```ruby
# Add to the end of seeds.rb after the TODO comment

puts "🌱 Seeding bookings..."

# Create some sample bookings
Booking.create(vendor: elegant_moments, wedding: smith_johnson, service_type: "Photography", cost: 2500, booking_date: "2024-06-15")
Booking.create(vendor: garden_party, wedding: garcia_lee, service_type: "Catering", cost: 4500, booking_date: "2024-07-20")
Booking.create(vendor: blooming_affairs, wedding: brown_wilson, service_type: "Flowers", cost: 800, booking_date: "2024-08-10")
Booking.create(vendor: sweet_dreams, wedding: martinez_kim, service_type: "Cake", cost: 1200, booking_date: "2024-09-05")
Booking.create(vendor: harmony_music, wedding: smith_johnson, service_type: "Music", cost: 1800, booking_date: "2024-06-15")
Booking.create(vendor: elegant_moments, wedding: garcia_lee, service_type: "Photography", cost: 3000, booking_date: "2024-07-20")

puts "🌱 Booking seeding complete!"
```
