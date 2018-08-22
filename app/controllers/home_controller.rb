class HomeController < ApplicationController

	def index
		if user_signed_in?
			if current_user.role == 0
				return redirect_to edit_student_path(id: current_user.id)
			elsif current_user.role == 1
				return redirect_to edit_tutor_path(id: current_user.id)
			elsif current_user.super_admin
				return redirect_to admin_index_path
			end
		end
	end

end
