class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	@title = ENV["appname"] || "Mentorship"
    protected
	def configure_permitted_parameters
 	  attributes = [:first_name, :last_name,:carrier_id,:mobile,:smsok]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
	def after_sign_in_path_for(resource)
		if User.count == 1
 			#Make Admin
 			current_user.admin = true
 			current_user.save
 		end
    	if current_user.fullname == "" 
    		edit_user_registration_url
    	else
    		root_path
    	end
	end
end
