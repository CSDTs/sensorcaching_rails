class CreateSensorData < ActiveRecord::Migration
  def change
    create_table :sensor_data do |t|
      t.integer :sensor_id
      t.datetime :timestamp
      t.float :data

      t.timestamps
    end
  end
end
