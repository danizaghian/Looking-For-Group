class GameGenresController < ApplicationController
	def show
		@genre = Genre.find(params[:genre_id])
		@games = @genre.games
	end
end
