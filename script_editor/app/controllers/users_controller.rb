class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]
  def show
    @user = User.find(params[:id])
  end

  def admin
    #only allow access if user is admin
  	unless current_user.try(:admin?)
  		redirect_to root_path
  		flash.alert = "You must be logged in as admin"
  	end
  end
    
  def new
    @user = User.new
  end
end
