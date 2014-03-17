json.array!(@sensors) do |sensor|
  json.extract! sensor, :id, :name, :description, :latitude, :longitude, :sensor_type_id, :user_id
  json.url sensor_url(sensor, format: :json)
end
