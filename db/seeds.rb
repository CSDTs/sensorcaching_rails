# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
SensorType.create(name: "Light")
SensorType.create(name: "Temperature")
SensorType.create(name: "Humidity")

u1 = User.create("first_name"=>"Michael", "last_name"=>"O'Keefe","zip"=>"03051",
 "email"=>"mikeco57@gmail.com", "password"=>"password")
u1.roles << :admin
u1.save

User.create("first_name"=>"Foo", "last_name"=>"Bar","zip"=>"12180",
 "email"=>"okeefm@rpi.edu", "password"=>"password2")

Sensor.create("name"=>"Sensor 1", "description"=>"This is Sensor 1.",
 "latitude"=>42.74983, "longitude"=>-71.417012, "user_id"=>1, "sensor_type_id"=>1,
 "address"=>"57 Glen Drive, Hudson, NH 03051, USA")
 
Sensor.create("name"=>"Sensor 2 Alvirne", "description"=>"This is another sensor near my home, this one is actually closer to my school. It's a temperature sensor.", "latitude"=>42.793747, "longitude"=>-71.437751, "user_id"=>1, "sensor_type_id"=>2, "address"=>"200 Derry Road, Hudson, NH 03051, USA")
Sensor.create("name"=>"Troy Sensor", "description"=>"This one is in Troy, near my apartment. It's a humidity sensor. It's sensor number 3.", "latitude"=>42.735096, "longitude"=>-73.680024, "user_id"=>2, "sensor_type_id"=>3, "address"=>"90 11th Street, Troy, NY 12180, USA")
