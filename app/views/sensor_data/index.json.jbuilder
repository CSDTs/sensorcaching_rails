json.array!(@sensor_data) do |sensor_datum|
  json.extract! sensor_datum, :id, :date, :data, :sensor_id
  json.url sensor_datum_url(sensor_datum, format: :json)
end
