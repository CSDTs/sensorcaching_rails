class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email,:password,:password_confirmation, :first_name, :last_name, :zip) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email,:password,:password_confirmation, :first_name, :last_name, :zip, :current_password) }
  end
end
