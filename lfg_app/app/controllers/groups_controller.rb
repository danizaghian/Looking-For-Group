class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def show
		id = params[:id]
		@group = Group.friendly.find(id)
	end

	def create
    group_params = params.require(:group).permit(:name, :city, :description, :meet_date)
    @group = Group.create(group_params)

    redirect_to @group
  end
	
	def edit
		@group = Group.friendly.find(params[:id])
	end

	def update
		group_id = params[:id]
		group = Group.friendly.find(group_id)
		updated_attributes = params.require(:group).permit(:name, :city, :description, :meet_date)
		group.update_attributes(updated_attributes)
		redirect_to group
	end
	
	def destroy
	end

end
