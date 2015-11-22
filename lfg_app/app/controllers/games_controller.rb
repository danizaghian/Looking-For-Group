class GamesController < ApplicationController
  
  def new
  	@games = Game.new
    @genres = Genre.all
  end
  def create
  	game_params = params.require(:game).permit(:name, :min_players, :max_players, :description)
  	@game = Game.create(game_params)
    game_genres = Genre.all 
    game_genres.each do |genre|
      if params[genre.name]
        @game.genres.push(genre)
      end
    end
    @game.save
  	redirect_to @game
  end
  def index
  	@games = Game.all

  end

  def show
    @game = Game.friendly.find(params[:id])
    @genres = @game.genres
  end
  def edit 
    @game = Game.friendly.find(params[:id])
  end
  def update
  	game_params = params.require(:game).permit(:name, :min_players, :max_players, :description)
  	@game = Game.friendly.find(params[:id])
  	@game.update_attributes(game_params)
  	redirect_to @game
  end
  def destroy
  	@game = Game.find(params[:id])
  	@game.destroy
  	redirect_to "/games"
  end

  def adduser
    @game = Game.find(params[:id])
    if @current_user.games.include?@game
      p "user already liked game"
    else 
      @current_user.games.push(@game)
    end
    # there exists an adduser view because rails broke when there wasn't a redirect
    #but this is only accessed via ajax request so we never actually need to reload the page
  end
end
