module ApplicationHelper
	def activated_class controller, method
  	controller_name == controller and action_name == method ? 'active' : ''
	end

  def display_cedits credit
    if credit == 1
      "#{credit} point from this post"
    else 
      "#{credit} points from this post"
    end
  end
   
end
