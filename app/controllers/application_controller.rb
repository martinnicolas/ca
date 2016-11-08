class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|  	
    redirect_to main_app.root_url, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
  	if current_user.role? :admin
  		admin_path
  	else
  		index_path
  	end
  end
end
