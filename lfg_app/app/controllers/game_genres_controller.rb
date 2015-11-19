class GameGenresController < ApplicationController

	def show
		@genre = Genre.find([:genre_id])
		@games = @genre.games
	end

end
