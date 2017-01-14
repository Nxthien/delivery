class Admins::CartsController < ApplicationController
  layout "admin"

  def index
    @carts = Cart.all.paginate(:page => params[:page], :per_page => 30)
  end
end