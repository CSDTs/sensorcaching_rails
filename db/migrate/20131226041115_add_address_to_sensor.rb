class AddAddressToSensor < ActiveRecord::Migration
  def change
    add_column :sensors, :address, :string
  end
end
