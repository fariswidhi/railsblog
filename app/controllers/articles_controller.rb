class ArticlesController < ApplicationController
	def index

    @articles = Article.all
	end
		
	def new

	end

	def create
	@articles = new Article.new(articles_param)		
	@articles.save
	redirect_to @article
	end
end
