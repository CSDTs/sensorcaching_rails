class SetRequiredVariables < ActiveRecord::Migration
  def change 
  
    reversible do |dir|
      dir.up do
        change_column_null(:users, :first_name, false)
        change_column_null(:users, :last_name, false)
        
        change_column_null(:sensors, :name, false)
        change_column_null(:sensors, :latitude, false)
        change_column_null(:sensors, :longitude, false)
        change_column_null(:sensors, :user_id, false)
        change_column_null(:sensors, :sensor_type_id, false)
        
        change_column_null(:sensor_types, :name, false)
        
        change_column_null(:sensor_finds, :user_id, false)
        change_column_null(:sensor_finds, :sensor_id, false)
        change_column_null(:sensor_finds, :time, false)
        
        change_column_null(:sensor_data, :timestamp, false)
        change_column_null(:sensor_data, :data, false)
      end
      
      dir.down do
        change_column_null(:users, :first_name, true)
        change_column_null(:users, :last_name, true)
        
        change_column_null(:sensors, :name, true)
        change_column_null(:sensors, :latitude, true)
        change_column_null(:sensors, :longitude, true)
        change_column_null(:sensors, :user_id, true)
        change_column_null(:sensors, :sensor_type_id, true)
        
        change_column_null(:sensor_types, :name, true)
        
        change_column_null(:sensor_finds, :user_id, true)
        change_column_null(:sensor_finds, :sensor_id, true)
        change_column_null(:sensor_finds, :time, true)
        
        change_column_null(:sensor_data, :timestamp, true)
        change_column_null(:sensor_data, :data, true)
      end
    end
    
    rename_column(:sensor_data, :sensor_id, :sensor_find_id)
  end
end
