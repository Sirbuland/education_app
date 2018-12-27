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
  end
 
  def declinepost
     
     @post  = Post.find(params[:id])
     @posttutor = PostTutor.find_by post_id: params[:id]
     @posttutor.update_attribute(:flag,false)
     @posttutor1 = PostTutor.new
     @posttutor1.post_id = @post.id  
     @posttutor1.tutor_id = current_user.id
     @posttutor1.flag = false
    
  
    if @posttutor1.save
      redirect_back(fallback_location: pending_path)
    end
  end

  def updatepost
   
   
     if params[:post][:correction] == "1"
    
      @post = Post.find(params[:id])
      @post.update_attribute(:correction,true)
      @post.update_attribute(:status,"Edited")
      @post.update_attribute(:edited_text,nil)
      @post.update_attribute(:tutor_id,current_user.id)
      
      @posttutor = PostTutor.find_by post_id: params[:id] 
      @posttutor.update_attribute(:flag,false)
    
      @posttutor1 = PostTutor.new
      @posttutor1.post_id = @post.id  
      @posttutor1.tutor_id = current_user.id

     else

      @post = Post.find(params[:id])
      @post.update_attribute(:status,"Edited")
      @post.update_attribute(:edited_text,params[:post][:edited_text])
      @post.update_attribute(:tutor_id,current_user.id)
      @posttutor = PostTutor.find_by post_id: params[:id] 
      @posttutor.update_attribute(:flag,false)
      
      @posttutor1 = PostTutor.new
      @posttutor1.post_id = @post.id  
      @posttutor1.tutor_id = current_user.id
      
      #@credit.update_attribute(:tutor_id, current_user.id)
      
     end
    if @posttutor1.save
     flash[:success] = "Post edited successfully"
     redirect_to pending_path
    end
  end

  def postshistory
   @posts = Post.all
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
    params.require(:post).permit(:edited_text,:tutor_id,:status,:correction)
  end

end
