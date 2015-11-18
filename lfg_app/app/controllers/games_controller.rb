class GamesController < ApplicationController
  def new
  	@games = Game.new
  end

  def index
  	@games = Game.all
  end

  def show
  	@game = Game.find(params[:id])
  end
  def create
  	game_params = params.require(:game).permit(:name, :min_players, :max_players, :description)
  	@game = Game.create(game_params)
  	redirect_to @game
  end
  def edit 
  	@game = Game.find(params[:id])
  end
  def update
  	game_params = params.require(:game).permit(:name, :min_players, :max_players, :description)
  	@game = Game.find(params[:id])
  	@game.update_attributes(game_params)
  	redirect_to @game
  end
  def destroy
  	@game = Game.find(params[:id])
  	@game.destroy
  	redirect_to "/games"
  end
end
