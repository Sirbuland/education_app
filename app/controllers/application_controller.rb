class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    if current_user.role == 0
      edit_student_path(id: current_user.id)
    elsif current_user.role == 1
      edit_tutor_path(id: current_user.id)
    end
  end

  def after_sign_out_path_for(resource)
  	root_url
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
    	keys: [ 
        :username, 
				:profile_pic,
				:full_name,
				:occupation,
				:city,
				:country,
				:date_of_birth,
				:gender,
				:role
			])
  end
end