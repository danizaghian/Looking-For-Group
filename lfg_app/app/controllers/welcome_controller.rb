class WelcomeController < ApplicationController
	def index
		render :welcome
	end
	def show
		render :about
	end
end
