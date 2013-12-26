namespace :export do
  desc "Prints Sensor.all in a seeds.rb way."
  task :seeds_format => :environment do
    Sensor.order(:id).all.each do |sensor|
      puts "Sensor.create(#{sensor.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end
