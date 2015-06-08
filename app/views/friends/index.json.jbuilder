json.array!(@friends) do |friend|
  json.extract! friend, :id, :name, :avatar, :like
  json.url friend_url(friend, format: :json)
end
