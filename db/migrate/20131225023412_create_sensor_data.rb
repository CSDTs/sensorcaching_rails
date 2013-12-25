class CreateSensorData < ActiveRecord::Migration
  def change
    create_table :sensor_data do |t|
      t.DateTime :date
      t.float :data
      t.integer :sensor_id

      t.timestamps
    end
  end
end
