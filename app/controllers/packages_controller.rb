class PackagesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_package, only: [:show]

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
