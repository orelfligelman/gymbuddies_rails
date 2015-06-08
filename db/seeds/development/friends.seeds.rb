80.times do
  Friend.create([
                    {name: Faker::Name.name, email: Faker::Internet.email, avatar: Faker::Avatar.image, like: false, user_id: 3 }
                ])
end

# hash = Hash.new
# %w(mr-potato-head-on-a-treadmill.jpg, ).each_with_index {|item, index|
#   hash[item] = index
# }
# hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}