80.times do
  Gym.create([
                 {name: Faker::Company.name, location: Faker::Address.city}
             ])
end