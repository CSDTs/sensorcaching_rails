json.array!(@sensor_finds) do |sensor_find|
  json.extract! sensor_find, :id
  json.url sensor_find_url(sensor_find, format: :json)
end
