class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.is_admin?
       admin_trash_requests_path
    else
    	super
    end
  end

  def check_address_detail
    if current_user.address_detail.present?
      return true
    else
      flash[:error] = "Please create Profile"
      redirect_to new_address_detail_path
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:mobile_no, :username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end