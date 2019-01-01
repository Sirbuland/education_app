class PostsController < ApplicationController
before_action :set_post, only:[:edit, :update ]
before_action :validate_user
	 def new

    @credits = current_user.packages.sum(:total_credits)
     @credits += current_user.packages.sum(:bonus)
     totalcred = current_user.used_credits.sum(:total_credits)
     if @credits > totalcred  
	     @post= Post.new 
       #@maximum_length = Post.validators_on( :original_text ).first.options[:maximum]
       @maximum_length =2100
     else 
       flash[:error] = "You dont have enough credits to create a post"
       redirect_to credits_path
    end
  end
   
   def create 
    #Creating new Post
     @post = Post.new(post_params)
     @post.status="Pending"
     @post.application= "true"
     @post.student_id= current_user.id
     @posttutor = PostTutor.new 
     
     
     #Creating new Credit with credits from text area directly
     @credits = Credit.new
     ida = current_user.id
     @user = User.find(ida)
     @credits.total_credits = (@post.original_text.size/70).floor
     
     if @post.save
       @credits.post_id = @post.id
       @posttutor.post_id = @post.id
       @posttutor.save
       @credits.save
		   flash[:success] = "Post created successfully"
		   redirect_to active_path
		 else
		render 'new'
		 end
   end
   
   def acceptapp
     @post = Post.find(params[:id])
     ida = current_user.id
     @user = User.find(ida)
     usedcred = 0
     @cred = Credit.find_by post_id: params[:id] 
     @cred.update_attribute(:student_id,current_user.id)
     
     
     #finding credits for respective user
      
     @user.used_credits.each do |credit|
        if credit.post_id == @post.id 
         usedcred = credit.total_credits
       break
       end
     end
=begin     
     #finding user's Package
     @user.packages.each do |package|
        if package.total_credits > 0 && package.total_credits > usedcred
          total=package.total_credits-usedcred
          package.update_attribute(:total_credits,total)
         break
        end
      end  
=end      
     #Tutor Credits
     tutid = @post.tutor_id
     @tutor = User.find(tutid)
     @availedcredit = Credit.new
     @availedcredit.total_credits = usedcred/2
     @availedcredit.tutor_id = @tutor.id
     @availedcredit.save
     @tutor.availed_credits << @availedcredit
      
     #Admin Credits
     @admin = User.find(1)
     @admincredits = Credit.new
     @admincredits.total_credits = usedcred/2
     @admincredits.admin_id = 1
     @admincredits.save
     @admin.admin_credits << @admincredits
      
     if @post.update_attribute(:status, "Closed")
       flash[:success] = "Post saved successfully"
       redirect_to active_path
     end
   end

   def declineapp
     @post= Post.find(params[:id])
     @post.update_attributes(:status => "SubmittedToAdmin", :application => false) 
     redirect_to active_path
   end 
   
   def history
    
		@posts = @current_user.created_posts.where(status: :Closed).paginate(page: params[:page],per_page:2)
  
	 end
	 
   def active 
    @posts = @current_user.created_posts.where.not(status: Post.statuses[:Closed]).paginate(page: params[:page],per_page:2)
	 end
	 
 private 
   def validate_user
    if current_user.role != 0
      redirect_to root_path
    end 
   end  
    def set_post
     @post = Post.find(params[:id])
    end
   
    def post_params
	    params.require(:post).permit(:original_text,:category_id,:language_id,tag_ids:[])
	  end
end

