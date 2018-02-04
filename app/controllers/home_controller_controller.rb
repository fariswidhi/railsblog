class HomeControllerController < ApplicationController
	def index
		@articles = Articles.all
	end
end
