module SensorsHelper
  def markers_from_sensors(sensors)
    hash = Gmaps4rails.build_markers(sensors) do |sensor, marker|
      marker.lat sensor.latitude
      marker.lng sensor.longitude
      marker.infowindow "<div>
                          <h2>" + sensor.name + "</h2>
                          <p>" + sensor.description + "</p>
                          <p><strong>Nearest Address:</strong>" + sensor.address + "</p>
                          <p><a href='/sensors/"+ sensor.id.to_s + "/'>More info</a></p>
                          
                        </div>"
    end
    return hash
  end
end
