class WelcomeController < ApplicationController
	def index
		if current_user == nil
			render :welcome
		else
			redirect_to "/home"
		end

	end
	def show
		render :about
	end
end
