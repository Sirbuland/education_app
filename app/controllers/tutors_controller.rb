class TutorsController < ApplicationController
	before_action :authenticate_user!
  
	before_action :set_tutor
 

  def edit
  	@languages = Language.order(:name)
  end
  def pending
    @posts = Post.all
    
  end
  def editpost
    @post  = Post.find(params[:id])
    #@post  = Post.find(params[:created_posts.id[])
  end
  def updatepost
    @post = Post.find(params[:id])
      @post.status="Edited"
    @post.tutor_id= current_user.id  
    if @post.update(post_params)
     flash[:save] = "Post edited successfully"
     redirect_to pending_path
    else
     render'editpost'
    end
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
  def save_languages language_ids
    @tutor.languages.destroy_all
  	language_ids.each do |language_id|
      if language_id.present?
        language = Language.find_by id: language_id
  		  @tutor.languages << language if language.present?
      end
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
  def post_params
    params.require(:post).permit(:edited_text,:tutor_id,:status)
   end
    
end
