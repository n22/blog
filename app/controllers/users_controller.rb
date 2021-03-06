class UsersController < ApplicationController
  def index
    @user = User.all
  end
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
    log_in @user
  	redirect_to @user
  	else
  		render 'new'
  	end
  end
  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end

  end 

  def show
  	@user = User.find params[:id]
    @articles = @user.articles
    #@article = @current_users.find(params[:id])
     #@article = current_user.article.build if logged_in?
    #@microposts = @user.microposts.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_path
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation).merge(is_admin: false)
  end
end
