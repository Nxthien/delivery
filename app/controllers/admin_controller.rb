class AdminController < ApplicationController
	before_action :authenticate_user! , :checkadmin?
  layout "admin"
  private
  	def checkadmin?
  		if !current_user.isadmin.present?
  			flash[:danger] = "Your account is not admin" 
  			redirect_to root_path
  		end
  		if authenticate_user! == nil
  			redirect_to root_path
  		end
   	end
end
