class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.belongs_to :user
      t.belongs_to :sensor_type

      t.timestamps
    end
  end
end
