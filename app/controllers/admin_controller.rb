class AdminController < ApplicationController
	before_action :authenticate_user! , :checkadmin?
  layout "admin"
  
  def index
    @carts = Cart.where(status: "Going")
  end
  
  def update_cart
    @cart = Cart.find(params[:cart][:id]).update_attributes(status: "Done")
    redirect_to admin_index_path
  end
  
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
