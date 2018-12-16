class TagsController < ApplicationController
	before_action :authenticate_user!
	before_action :validate_user
	before_action :set_tag, only:[:show, :edit, :update ]


	def index
      @tags_count = Tag.count
  	  respond_to do |format|
		  format.html
		  format.json { render json: TagsDatatable.new(view_context) }
		end
	end
	def show
  	
  end	
  def new 
	 @tag = Tag.new
	end
  def create 
	 @tag = Tag.new(tag_params)
		if @tag.save
		 flash[:save] = "Tag created successfully"
		 redirect_to tags_path
		else
		 	render'new'
		end
  end
  def edit
  
  end
  def update
		if @tag.update(tag_params)
		 flash[:save] = "Tag updated successfully"
		 redirect_to tag_path(@tag)
		 else
		 	render'edit'
		 end
	end
  def destroy
	  @tag = Tag.find(params[:id]).destroy
	  flash[:save] = "Tag deleted successfully"
		redirect_to tags_path()
	end
 
private 
  def set_tag
    @tag = Tag.find(params[:id])
  end

	def tag_params
	  params.require(:tag).permit(:name,:description)
	end
	def validate_user
	if !current_user.super_admin
      redirect_to root_path
  end 
end
end