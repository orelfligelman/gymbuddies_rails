json.array!(@butts) do |butt|
  json.extract! butt, :id, :name, :location, :fart, :shape, :percentbodysize
  json.url butt_url(butt, format: :json)
end
