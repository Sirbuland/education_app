class TutorsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_tutor

  def edit
  	@languages = Language.order(:name)
  end

  def update
  	if @tutor.update_without_password(user_params)
  		save_languages params[:user][:language_ids]
  		flash[:success] = "Tutor has been updated successfully."
  	else
  		flash[:error] = "Error occurred while updating student. #{@tutor.errors.full_messages.to_sentence}"
  	end
  	redirect_back fallback_location: root_url
  end

  private

  def set_tutor
  	@tutor = current_user
  end

  def save_languages languages
    @tutor.languages.destroy_all
  	languages.each do |language|
  		@tutor.languages.find_or_create_by(name: language) if language.present?
  	end
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
  		:qualification,
  		:specialization,
  		:profile_pic
  	)
  end
end
