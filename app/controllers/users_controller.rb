class UsersController < ApplicationController
  def index
  	@users = User.all
    render :index
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
      flash[:error] = @user.errors.full_messages
      redirect_to root_path
    end
  end

	def show
	  @user = User.friendly.find(params[:id])
    @genres = @user.genres
    @allgenres = Genre.all
	end

	def edit
      id = params[:id]
      @user = User.friendly.find(id)
      render :edit
    end

    def update
      user_id = params[:id]
      user = User.friendly.find(user_id)
      updated_attributes = params.require(:user).permit(:first_name, :last_name, :email, :city, :age, :description, :avatar)
      user.update_attributes(updated_attributes)
      user_genres = Genre.all
      user.genres = [] 
        user_genres.each do |genre|
          if params[genre.name]
            user.genres.push(genre)
          end
        end
      redirect_to user
    end

    def destroy
      user = User.friendly.find(params[:id])
      logout
      user.destroy
      redirect_to root_path
    end

    def inbox
      id=params[:user_id]
      @user = User.friendly.find(id)
      if @user != @current_user
        redirect_to @user
      end
    end

    def sent_message
      cur_id = params[:current]
      reciever = params[:reciever_id]
      @current_user = User.find(cur_id)
      @user = User.friendly.find(reciever)
      @current_user.send_message(@user, params[:content], params[:title])
      redirect_to params[:endLocation]
    end
end
