class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    alias_action :create, :read, :update, :destroy, :to => :crud
    
    can :read, :all
    can :create, Sensor
    can :create, SensorDatum
    can :create, User
    can :crud, Sensor, :user_id => user.id
    can :crud, SensorDatum, :user_id => user.id
    
    if user.has_role? :admin
      can :manage, :all
    end
    
  end
end
