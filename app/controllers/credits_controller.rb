class CreditsController < ApplicationController
	before_action :authenticate_user!

	def index
		@packages = Package.all
	end

end
