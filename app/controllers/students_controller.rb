class StudentsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_student

  def edit
  end

  def update
  	if @student.update_without_password(user_params)
  		flash[:success] = "Student has been updated successfully."
  	else
  		flash[:error] = "Error occurred while updating student. #{@student.errors.full_messages.to_sentence}"
  	end
  	redirect_back fallback_location: root_url
  end

  private

  def set_student
  	@student = current_user
  end

  def user_params
  	params.require(:user).permit(
  		:full_name,
  		:username,
  		:occupation,
  		:city,
  		:country,
  		:date_of_birth,
  		:gender,
  		:profile_pic
  	)
  end

end
