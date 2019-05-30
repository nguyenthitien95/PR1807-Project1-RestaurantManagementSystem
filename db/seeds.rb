# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: "nxy assasin", email: "nvt94.ptit@gmail.com",
  password: "xxxxxx", password_confirmation: "xxxxxx",
  address: "address", phone_number: "0987654321", gender: "male",
  activated: true,
  activated_at: Time.zone.now,
  birth_date: Faker::Date.birthday)
20.times do |n|
  name = Faker::Name.last_name
  email = "example_#{n}@gmail.com"
  address = Faker::Lorem.sentence(10)
  phone_number = Faker::PhoneNumber.cell_phone
  gender = ["male", "female", "other"].sample
  date = Faker::Date.birthday
  User.create!(name: name, email: email, address: address, phone_number: phone_number, gender: gender,
    password: "xxxxxx", password_confirmation: "xxxxxx",
    activated: [true, false].sample,
    activated_at: Time.zone.now,
    birth_date: date)
end

Position.create!(name: "phuc vu", description: "phuc vu mon an", salary: 5_000_000)
Position.create!(name: "thu ngan", description: "thu tien", salary: 5_000_000)
Position.create!(name: "bao ve", description: "trong xe", salary: 5_000_000)
Position.create!(name: "dau bep", description: "nau an", salary: 7_000_000)

Staff.create!(name: "nxy assasin", username: "nvtxxx",
  password: "xxxxxx", password_confirmation: "xxxxxx",
  address: "address", phone_number: "0987654321", gender: "male",
  birth_date: Faker::Date.birthday, position: Position.first)

20.times do |n|
  name = Faker::Name.last_name
  username = "example_#{n}"
  address = Faker::Lorem.sentence(10)
  phone_number = Faker::PhoneNumber.cell_phone
  gender = ["male", "female", "other"].sample
  position = Position.all.sample
  Staff.create!(name: name, username: username, address: address, phone_number: phone_number,
    gender: gender, password: "xxxxxx", password_confirmation: "xxxxxx",
    birth_date: Faker::Date.birthday, position: position)
end

10.times do
  Table.create!(status: false)
end

10.times do
  Reservation.create!(user: User.all.sample, table: Table.all.sample,
    numbers_people: (1..5).to_a.sample, status: false,
    date_time: DateTime.now)
end

Category.create!(name: "category 1", description: "no des", status: true)
Category.create!(name: "category 5", description: "no des", status: true, parent_id: 1)
Category.create!(name: "category 6", description: "no des", status: true, parent_id: 1)
Category.create!(name: "category 7", description: "no des", status: true, parent_id: 1)

10.times do
  Dish.create!(name: Faker::Food.name, description: "no des",
    price: (1..10).to_a.sample * 10_000, promotion: (0..100).to_a.sample,
    status: true, category: Category.all.sample)
end

20.times do
  ReservedDish.create!(reservation: Reservation.all.sample, dish: Dish.all.sample,
    quantity: (1..5).to_a.sample)
end

staffs = Staff.all
staffs.each {|staff| staff.salaries.create!(salary: staff.position.salary,
  from_date: DateTime.now - 30,
  to_date: DateTime.now)}
