class SensorFind < ActiveRecord::Base
  has_many :sensor_data
  belongs_to :sensor
  belongs_to :user
end

