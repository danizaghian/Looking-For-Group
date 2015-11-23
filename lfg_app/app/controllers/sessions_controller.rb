class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:username, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      # redirect_to "/users/#{@user.id}"
      redirect_to "/home"
    else
      flash[:error] = "Error, cannot find user"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:error] = "Successfully logged out"
    redirect_to login_path
  end

end
