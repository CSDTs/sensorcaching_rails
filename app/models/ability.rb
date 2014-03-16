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
    can :crud, Sensor, :user_id => user.id
    can :crud, SensorDatum, :user_id => user.id
    can :sensors_by_type, Sensor
    can :sensors_near_me, Sensor
    
    if user.has_role? :admin
      can :manage, :all
    end
    
  end
end
