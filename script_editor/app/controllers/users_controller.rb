class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def admin
    #only allow access if user is admin
  	@user = User.find(params[:id])
  	unless @user.admin?
  		redirect_to root_path
  		flash.alert = "You must be logged in as admin"
  	end
    
  def new
    @user = User.new
  end
end
