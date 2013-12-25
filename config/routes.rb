SensorcachingRails::Application.routes.draw do
  resources :sensors

  resources :sensor_types

  devise_for :users
  devise_for :views
  root :to => 'visitors#new'
end
