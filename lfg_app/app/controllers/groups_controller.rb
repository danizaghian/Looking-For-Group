class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def show
	end

	def create
    group_params = params.require(:group).permit(:name, :city, :meet_date)
    @group = Group.create(group_params)

    redirect_to groups_path
  end
	
	def edit
	end

	def update
	end
	
	def destroy
	end

end
