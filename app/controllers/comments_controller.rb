class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:destroy]
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private

	def comment_params
		params.require(:comment).permit(:body).merge(commenter: commenter)
	end
	def commenter
		if logged_in?
			@commenter = current_user.name
		else 
			@commenter = 'anonymous'
		end
	end
end
