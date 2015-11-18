class GenresController < ApplicationController
  def new
  	@genre = Genre.new
  end
  def create
  	genre_params = params.require(:genre).permit(:name)
  	@genre = Genre.create(genre_params)
  	redirect_to @genre
  end
def index
  	@genres = Genre.all
  end

  def show
  	@genre = Genre.find(params[:id])
  end
  def edit 
  	@genre = Genre.find(params[:id])
  end
  def update
  	genre_params = params.require(:genre).permit(:name)
  	@genre = Genre.find(params[:id])
  	@genre.update_attributes(genre_params)
  	redirect_to @genre
  end
  def destroy
  	@genre = Genre.find(params[:id])
  	@genre.destroy
  	redirect_to "/genres"
  end
end