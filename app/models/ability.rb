class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    alias_action :create, :read, :update, :destroy, :to => :crud
    
    can :read, :all
    can :create, Sensor
    can :index, Sensor
    can :create, SensorDatum
    can :create, User
    can :crud, [Sensor, SensorDatum, SensorFind], :user_id => user.id
    can :sensors_by_type, Sensor
    can :sensors_near_me, Sensor
    can :sensors_by_user, Sensor
    
    if user.has_role? :admin
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
      can :manage, :all
    end
  end
end

