class GameGenresController < ApplicationController

	def index
		@genre = Genre.find([:genre_id])
		@games = @genre.games
	end

end
