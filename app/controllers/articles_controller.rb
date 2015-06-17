class ArticlesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :new]
	def new 
		@article = Article.new
	end
	def show
		 @article = Article.find(params[:id])
	end
	def index
		@articles = Article.all

	end
	def edit 
		@article = Article.find(params[:id])
	end
	def create
		@user = current_user
		@article = current_user.articles.build(article_params)
		if @article.save
			redirect_to @user
		else
			render 'static_pages/home'
		end
	end
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to current_user
		else
			render 'new'
		end
	end
	def destroy
	end

	#http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
=begin
	def index
		@articles = Article.all
	end
	def new 
		@article = Article.new
	end
	def edit
  		@article = Article.find(params[:id])
	end
	def show
		    @article = Article.find(params[:id])
	end
	def create
		@user = User.find(params[:user_id])
		@article = @user.articles.create(article_params)
 
  	if @article.save
  		redirect_to @article
  	else
  		render 'new'
  	end
	end

	def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end
=end
	private
	 def article_params
     	params.require(:article).permit(:title, :text)
     end
end
