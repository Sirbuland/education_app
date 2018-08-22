class PackagesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_package, only: [:show, :edit, :update, :destroy]

  def index
  	@packages_count = Package.count
  	respond_to do |format|
		  format.html
		  format.json { render json: PackagesDatatable.new(view_context) }
		end
  end

  def new
  	@package = Package.new
  end

  def create
  	@package = Package.new(package_params)
  	if @package.save
  		flash[:success] = "Your package has been saved successfully."
  		redirect_to packages_path
  	else
  		flash[:error] = "Error occurred while saving package. #{@package.errors.full_messages.to_sentence}"
  		redirect_back fallback_location: root_path
  	end
  end

  def edit
  end
  
  def update
  	if @package.update(package_params)
      flash[:success] = "Your package has been updated successfully."
      redirect_to packages_path
    else
      flash[:error] = "Error occurred while updating package. #{@package.errors.full_messages.to_sentence}"
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    if @package.destroy
      flash[:success] = "Your package has been removed successfully."
    else
      flash[:error] = "Error occurred while removing package. #{@package.errors.full_messages.to_sentence}"
    end
    redirect_back fallback_location: packages_path
  end

  private

  def package_params
  	params.require(:package).permit(
  		:id,
  		:name,
			:price,
			:total_number_of_characters,
			:total_credits,
			:bonus
  	)
  end

  def set_package
  	@package = Package.find_by id: params[:id]
  end
end
