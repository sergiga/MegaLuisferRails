# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin user.
User.create(
  name: "Alejandro Alonso Taratiel",
  username: "admin",
  email: "alejandro@megaluisfer.com",
  password: "admin",
  admin: true,
  telephone: "654821719"
)

# Phone brands
PhoneBrand.create(brand: "BQ")
PhoneBrand.create(brand: "IPhone")
PhoneBrand.create(brand: "Lg")
PhoneBrand.create(brand: "Motorola")
PhoneBrand.create(brand: "Samsung")
PhoneBrand.create(brand: "Sony")
PhoneBrand.create(brand: "Xiaomi")

# -------------- FAKE DATA --------------

# Fake clients, bills and repairs.
4.times do
  client =
    Client.create(
      cif_dni: Faker::Code.asin,
      name: Faker::Name.first_name,
      address: Faker::Address.street_name,
      contact_phone: Faker::PhoneNumber.phone_number
    )
  3.times do
    bill =
      client.bills.create(
        price: Faker::Number.decimal(2, 2)
      )
    bill.repairs.create(
      status: 0,
      description: Faker::Lorem.sentence(10)
    )
  end
end

# Fake phones models
PhoneBrand.all.each do |pb|
  3.times do
    pb.phones.create(
    model: Faker::Name.name,
    model_review: Faker::Lorem.word
    )
  end
end
