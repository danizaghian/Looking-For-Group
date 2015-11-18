class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    # validate params and save them as a variable
    user_params = params.require(:user).permit(:username, :first_name, :last_name, :email, :city, :age, :description)
    # create a new user with those params
    user = User.create(user_params)
    redirect_to user
    # ^ same as redirect_to "/users"
  end

	def show
	  # get the id parameter from the url
	  id = params[:id]
	  # find the user with that id and save to an instance variable
	  @user = User.find(id)
	end
end
