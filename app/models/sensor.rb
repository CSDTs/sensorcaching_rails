class Sensor < ActiveRecord::Base
  belongs_to :sensor_type
  belongs_to :user
end
