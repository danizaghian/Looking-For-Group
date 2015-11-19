class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

    def show
     @user = User.friendly.find(params[:id])
    render :show
  end
  
  def create
    user_params = params.require(:user).permit(:username, :first_name, :last_name, :email, :city, :age, :description)
    user = User.create(user_params)
    login(@user)
    redirect_to user
  end

	def edit
      id = params[:id]
      @user = User.find(id)
      render :edit
    end

    def update
      user_id = params[:id]
      user = User.find(user_id)
      updated_attributes = params.require(:user).permit(:username, :first_name, :last_name, :email, :city, :age, :description)
      user.update_attributes(updated_attributes)
      redirect_to user
    end

    def destroy
      id = params[:id]
      user = User.find(id)
      user.destroy
      redirect_to users_path
    end
end
