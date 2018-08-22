module ApplicationHelper
	def activated_class controller, method
		controller_name == controller and action_name == method ? 'active' : ''
	end
end
