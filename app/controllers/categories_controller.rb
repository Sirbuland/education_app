class CategoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :validate_user
	before_action :set_category, only:[:show, :edit, :update ]

	def index
    @categories_count = Category.count
	  respond_to do |format|
	   format.html
	   format.json { render json: CategoriesDatatable.new(view_context) }
    end
	end

	def show
  end	
  
  def new 
	  @category = Category.new
	end
  
  def create 
	  @category = Category.new(category_params)
	  if @category.save
		  flash[:success] = "Category created successfully"
		  redirect_to categories_path
	  else
	   render'new'
	  end
  end
  
  def edit
  end
  
  def update
	  if @category.update(category_params)
		 flash[:success] = "Category updated successfully"
		 redirect_to recipe_path(@category)
	  else
		 	render'edit'
	  end
	end
  
  def destroy
	  @category = Category.find(params[:id]).destroy
	  flash[:success] = "Category deleted successfully"
		redirect_to categories_path()
	end

 private 
  
  def set_category
    @category = Category.find(params[:id])
  end
 
  def category_params
	  params.require(:category).permit(:name,:description)
	end

	def validate_user
    if !current_user.super_admin
      redirect_to root_path
    end 
  end
 end
 