class PostsController < ApplicationController
before_action :set_post, only:[:edit, :update ]

	 def new 
	   @post= Post.new 
	 end

     def create 

	  @post = Post.new(post_params)
      @post.status="Pending"
      @post.application= "true"
      @post.student_id= current_user.id
			if @post.save
			flash[:save] = "Post created successfully"
			redirect_to active_path
			else
				render'new'
			end
     end
     
    def acceptapp
    	@post = Post.find(params[:id])
        if @post.update_attribute(:status, "Closed")
        flash[:save] = "Post edited successfully"
        redirect_to active_path
        end
    end

    def declineapp
    	@post= Post.find(params[:id])
    	@post.update_attribute(:application, false)
        flash[:save] = "Post edited successfully"
        redirect_to active_path
    end 
    def history 
		#@post=Post.all
		@posts = Post.paginate(page: params[:page], per_page: 5)
		  
	 end
	  
	def active 
		#@post=Post.all
		@posts = Post.paginate(page: params[:page], per_page: 5)
		  
	 end
	 
private 
     def set_post
       @post = Post.find(params[:id])
     end

	 def post_params
	   params.require(:post).permit(:original_text,:category_id,:language_id,tag_ids:[])
	 end

	 
end