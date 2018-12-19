class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :validate_user

  def index
  end

  def declinedapplication
  	@post = Post.all
  end

private
  
  def validate_user
	  if !current_user.super_admin
      redirect_to root_path
    end 
  end
  
end
