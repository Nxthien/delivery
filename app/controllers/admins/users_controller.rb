class Admins::UsersController < ApplicationController
  layout "admin"
  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 30) 
  end

  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(res_params)
    if @user.save
      flash[:success] = "Created User"
      redirect_to admins_users_path
    else
      flash[:danger] = "Create User Fail"
      redirect_to admins_users_path
    end
  end
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to admins_users_path
  end
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      flash[:success] = "Updated Restaurant"
      redirect_to admins_users_path
    else
      flash[:danger] = "Update Restaurant Fail"
      redirect_to edit_admins_users_path
    end
  end

  private

  def user_params
    params.require(:restaurant).permit(:name, :email, :address, :phone_number, :isadmin)
  end
end
