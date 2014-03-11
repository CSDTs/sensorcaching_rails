class CreateSensorFinds < ActiveRecord::Migration
  def change
    create_table :sensor_finds do |t|
      t.integer :user_id
      t.integer :sensor_id
      t.datetime :time
      t.timestamp :comments

      t.timestamps
    end
  end
end
