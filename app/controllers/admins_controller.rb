class AdminsController < ApplicationController
  def new
  end

  def show
  end

  def index
  	@current_user = User.find session[:user_id]
  	if @current_user.is_admin!=true
  		redirect_to root_url
  	end
  	@user = User.all
  end
end
