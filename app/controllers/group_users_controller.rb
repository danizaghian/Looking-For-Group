class GroupUsersController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@groups = @user.groups
	end
end
