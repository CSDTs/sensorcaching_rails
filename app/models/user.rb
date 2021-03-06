class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :sensors
  
  geocoded_by :zip
  after_validation :geocode
  
  include RoleModel
  roles_attribute :roles_mask
  roles :admin, :manager
end
