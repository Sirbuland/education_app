class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_student_credits, if: [:user_signed_in?, :is_student?]

  def set_student_credits
  
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.super_admin
      admin_index_path
    elsif resource.role == 0
      edit_student_path(id: resource.id)
    elsif resource.role == 1
      edit_tutor_path(id: resource.id)
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
				:role,
        :qualification,
        :specialization
			])
  end
  
  private

  def is_student?
    current_user.role == 0
  end
end
