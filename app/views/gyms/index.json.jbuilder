json.array!(@gyms) do |gym|
  json.extract! gym, :id, :name, :location, :avatar
  json.url gym_url(gym, format: :json)
end
