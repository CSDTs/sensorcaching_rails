class AddIndicesToTables < ActiveRecord::Migration
  def change
    add_index :sensor_data, :sensor_find_id
    add_index :sensor_finds, :user_id
    add_index :sensor_finds, :sensor_id
    add_index :sensor_types, :name, :unique => true
    add_index :sensors, :user_id
    add_index :sensors, :sensor_type_id
    add_index :sensors, :latitude
    add_index :sensors, :longitude
    add_index :users, :latitude
    add_index :users, :longitude
  end
end
