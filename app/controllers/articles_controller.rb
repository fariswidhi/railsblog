class ArticlesController < ApplicationController
	def index

    @articles = Article.all
	end
		
	def new

  		@article = Article.new
	end
	def create
	@articles = Article.new(articles_param)		

	@articles.save
	redirect_to @articles
	end
	def show
		@article = Article.find(params[:id])
	end

	def edit
				@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(articles_param)
			redirect_to @article
		else
			render 'edit'
		end

		
	end

	private 

	def articles_param
		params.require(:article).permit(:title,:text)
		
	end

 
end
