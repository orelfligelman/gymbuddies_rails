# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


80.times do
  User.create([
                  {name: Faker::Name.name, email: Faker::Internet.email}
               ])

end
80.times do
  Friend.create([
                    {name: Faker::Name.name, email: Faker::Internet.email, avatar: Faker::Avatar.image, like: false, user_id: 3 }
              ])

end
80.times do
  Gym.create([
                 {name: Faker::Company.name, location: Faker::Address.city}
             ])
end
80.times do
  Address.create(
      [{city: Faker::Address.city ,street_name:  Faker::Address.street_name, street_address: Faker::Address.street_address, secondary_address: Faker::Address.secondary_address, building_number: Faker::Address.building_number, zip_code: Faker::Address.zip_code, time_zone: Faker::Address.time_zone, street_suffix: Faker::Address.street_suffix, city_suffix: Faker::Address.city_suffix, city_prefix: Faker::Address.city_prefix, state_abbr: Faker::Address.state_abbr, state: Faker::Address.city_prefix, country: Faker::Address.state_abbr, state: Faker::Address.state, country: Faker::Address.country, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude}]
  )
end
# Generate 80 customers
# 80.times do |i|
#   c = Customer.new
#   firstname = "#{Faker::Name.first_name}"
#   lastname = "#{Faker::Name.last_name}"
#
#   c.users_user_id = users[i].user_id
#   c.customer_id = SecureRandom.random_number(999999999)
#   c.cust_email = "#{Faker::Internet.free_email(firstname)}"
#   c.cust_phone1 = "#{Faker::PhoneNumber.phone_number}"
#   c.cust_phone2 = "#{Faker::PhoneNumber.cell_phone}"
#   c.cust_title = "#{Faker::Name.prefix}"
#   c.cust_firstname = firstname
#   c.cust_lastname = lastname
#   c.save
# end
#
#
# photos = []
# 1000.times do
# Photo.create(
#   file_d = ["a","b","c","d"]
#   value = file_d[i]
#   [
#       {"name" => "#{value}"}
#   ]
#   )
#   i += 1
# end
# )



