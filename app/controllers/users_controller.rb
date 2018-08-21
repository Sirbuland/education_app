class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
  	
  end

  def update
  	method = user_params[:password].blank? ? :update_without_password : :update_with_password

		if @user.send(method, user_params)
      sign_in @user, bypass: true
			flash[:success] = "Your information has been saved successfully."
			redirect_back fallback_location: root_path
		else
			flash[:error] = "Error occured while updating user. #{@user.errors.full_messages.to_sentence}"
			render :edit
		end
  end

  private

  def set_user
  	@user = current_user
  end

  def user_params
  	params.require(:user).permit(
  		:email,
  		:full_name,
  		:gender,
  		:date_of_birth,
  		:password,
  		:password_confirmation,
  		:current_password
  	)
  end

end
