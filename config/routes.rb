SensorcachingRails::Application.routes.draw do
  resources :sensor_data
  resources :sensors
  resources :sensor_types
  resources :sensor_finds

  devise_for :users
  devise_for :views
  
  root :to => 'visitors#new'
  
  get '/sensors_by_user/:id', to: 'sensors#sensors_by_user'
  get 'sensors_near_me/:dist', to: 'sensors#sensors_near_me'
  get 'sensors_near_me/', to: 'sensors#sensors_near_me'
  get 'sensors_by_type/:type', to: 'sensors#sensors_by_type'
end
