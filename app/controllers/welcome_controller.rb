class WelcomeController < ApplicationController

	def index
		if current_user == nil
			@user = User.new
			@genres = Genre.all
			render :welcome, :layout => false
		else
			redirect_to "/home"
		end

	end
	def show
		render :about
	end
end
