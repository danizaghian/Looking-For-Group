class UserGenresController < ApplicationController
	def show
		@genre = Genre.find(params[:genre_id])
		@users = @genre.users
	end
end
