class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
    @user = User.new
    @genres = Genre.all
  end
  
  def create
    user_params = params.require(:user).permit(:username, :first_name, :last_name, :email, :city, :age, :description, :password, :avatar)
    @user = User.create(user_params)
    login(@user)
    user_genres = Genre.all 
    user_genres.each do |genre|
      if params[genre.name]
        @user.genres.push(genre)
      end
    end
    if @user.save
    session[:user_id] = @user.id
    redirect_to @user
  else 
    redirect_to new_user_path
  end
  end

	def show
	  id = params[:id]
	  @user = User.friendly.find(id)
    @genres = @user.genres
	end

	def edit
      id = params[:id]
      @user = User.friendly.find(id)
      render :edit
    end

    def update
      user_id = params[:id]
      user = User.friendly.find(user_id)
      updated_attributes = params.require(:user).permit(:username, :first_name, :last_name, :email, :city, :age, :description, :avatar)
      user.update_attributes(updated_attributes)
      redirect_to user
    end

    def destroy
      id = params[:id]
      user = User.friendly.find(id)
      user.destroy
      redirect_to users_path
    end
end
