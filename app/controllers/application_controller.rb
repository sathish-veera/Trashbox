class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

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

end
