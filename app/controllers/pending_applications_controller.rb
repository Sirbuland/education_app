class PendingApplicationsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_user, only: [:update]

  def index
  	respond_to do |format|
		  format.html
		  format.json { render json: UserDatatable.new(view_context) }
		end
  end

  def update
  	if params[:activate].present?
  		if @user.update(activated: true)
  			@message = "success"
  		else
  			@message = "alert"
  		end
  	end
  end

  private

  def set_user
  	@user = User.find_by id: params[:id]
  end
end
