json.array!(@sensor_finds) do |sensor_find|
  json.extract! sensor_find, :id, :sensor_id, :comments, :timestamp, :user_id
  json.url sensor_find_url(sensor_find, format: :json)
end
