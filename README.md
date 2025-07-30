# Phase 3 Mock Code Challenge: Wedding Planning System

For this challenge, you'll be working with a wedding planning domain.

We have three models: `Vendor`, `Wedding`, and `Booking`.

For our purposes, a `Vendor` has many `Booking`s, a `Wedding` has many `Booking`s, and a `Booking` belongs to a `Vendor` and to a `Wedding`.

`Vendor` - `Wedding` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you start coding_. Identify a single source of truth for your data.

## Topics

- Classes and Instances
- Class and Instance Methods
- Variable Scope
- Object Relationships
- Arrays and Array Methods

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed in a suggested order, but you can feel free to tackle the ones you think are easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge has tests to help you check your work. You can run `rake` to run the tests. Additionally, you can run `rake console` to explore your code in an interactive console and test out the methods you write.

Writing error-free code is more important than completing all of the deliverables listed - prioritize writing methods that work over writing more methods that don't work.

## What You Already Have

The starter code has migrations and models for the initial `Vendor` and `Wedding` models, and seed data for some `Vendor`s and `Wedding`s. The schema currently looks like this:

#### `vendors` Table

| Column           | Type    |
| ---------------- | ------- |
| name             | String  |
| established_year | Integer |

#### `weddings` Table

| Column       | Type   |
| ------------ | ------ |
| couple_names | String |

You will need to create the migration for the `bookings` table using the attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to build out any helper methods if needed.

### Migrations

Before working on the rest of the deliverables, you will need to create a migration for the `bookings` table.

- A `Booking` belongs to a `Vendor`, and a `Booking` also belongs to a `Wedding`. In your migration, create any columns your `bookings` table will need to establish these relationships.
- The `bookings` table should also have:
  - A `service_type` column that stores a string (e.g., "Photography", "Catering", "Flowers")
  - A `cost` column that stores an integer (cost in dollars)
  - A `booking_date` column that stores a string (date in "YYYY-MM-DD" format)

After creating your migration, you can run `rake db:migrate` and `rake db:seed` to run your migration and seed the database. Take a look at the seed file to see what data you'll be working with.

### Object Relationship Methods

Use ActiveRecord association macros and ActiveRecord query methods where appropriate (i.e., `has_many`, `has_many through`, and `belongs_to`).

#### Booking

- `Booking#vendor`
  - should return the `Vendor` instance for this booking
- `Booking#wedding`
  - should return the `Wedding` instance for this booking

#### Vendor

- `Vendor#bookings`
  - returns a collection of all the bookings for the vendor
- `Vendor#weddings`
  - returns a collection of all the weddings that have booked this vendor (through bookings)

#### Wedding

- `Wedding#bookings`
  - returns a collection of all the bookings for the wedding
- `Wedding#vendors`
  - returns a collection of all the vendors that have been booked by this wedding (through bookings)

### Aggregate and Association Methods

#### Vendor

- `Vendor#create_booking(wedding, service_type, cost, booking_date)`
  - takes a `wedding` (an instance of the `Wedding` class), a `service_type` (string), `cost` (integer), and `booking_date` (string) as arguments
  - creates a new `Booking` instance and associates it with this vendor and the wedding
  - **Challenge**: Add validation to ensure the booking_date is in a valid "YYYY-MM-DD" format
- `Vendor.most_established`
  - returns the `Vendor` instance with the earliest (lowest) `established_year`
- `Vendor#total_revenue`
  - returns the total cost of all bookings for this vendor as an integer

#### Wedding

- `Wedding#booked_service?(service_type)`
  - takes a `service_type` (string) as argument
  - returns `true` if this wedding has booked that type of service, `false` otherwise
- `Wedding#total_budget`
  - returns the total cost of all bookings for this wedding as an integer
- `Wedding#reschedule_booking(booking, new_date)`
  - takes a `booking` (an instance of the `Booking` class) and a `new_date` (string) as arguments
  - updates the booking's date, but only if the booking belongs to this wedding
  - **Challenge**: Add validation to ensure the new_date is in a valid "YYYY-MM-DD" format
  - returns the updated booking if successful, or `nil` if the booking doesn't belong to this wedding

#### Booking

- `Booking#service_details`
  - returns a string with the booking details in this format:
  - `"[Wedding couple_names] booked [service_type] ($[cost]) with [vendor name] on [booking_date]"`
  - example: `"Smith-Johnson Wedding booked Photography ($2500) with Elegant Moments Photography on 2024-06-15"`
- `Booking.expensive_bookings`
  - returns all `Booking` instances where the cost is greater than $1000

## Rubric

You can find the rubric for this code challenge [here](https://github.com/learn-co-curriculum/se-rubrics/blob/master/module-1.md).

## Difficulty Level

This challenge is designed to be **more challenging** than previous ActiveRecord exercises. It includes:

- Mathematical calculations and aggregation methods
- Date handling and validation concepts
- Class methods with filtering requirements
- More complex string formatting
- Additional database attributes requiring careful design
- A total of 8 methods to implement (compared to 5 in simpler challenges)

Take your time, plan your approach, and remember that working methods are more important than completing every deliverable.
