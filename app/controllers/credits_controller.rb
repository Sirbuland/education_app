class CreditsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_package, only: [:show, :create]

	def index
		@packages = Package.all
	end

	def create
		if @package.present?
			current_user.packages << @package
			flash[:success] = "Package has been added to student account."
			redirect_to packages_path
		else
			flash[:error] = "Some error occurred while adding package to student account."
			redirect_back fallback_location: credits_path
		end
	end

	def show
		render 'show', layout: false
	end

	private

	def set_package
		@package = Package.find_by id: params[:id]
	end

end
