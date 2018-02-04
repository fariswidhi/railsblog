class HomeController < ApplicationController
  skip_before_action :require_valid_user!
	def index
		@current_user = session[:user_id]
		@articles = Article.all
	end
	def detail
		@id = params[:id].split('-').last
		@article = Article.find(@id)
		render 'show'

	end
end
