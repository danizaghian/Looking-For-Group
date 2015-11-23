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

	def join
		@group = Group.friendly.find(params[:group_id])
		@group.users << User.friendly.find(params[:currentuser])
		redirect_to @group
	end

	def leave
		@group = Group.friendly.find(params[:group_id])
		@group.users.delete(User.friendly.find(params[:currentuser]))
		redirect_to @group
	end

	def create
    group_params = params.require(:group).permit(:name, :city, :description, :meet_date)

    	# group_id = params[:id]
    	# group = Group.friendly.find(group_id)
      # if current_user.events.include? group
    	
    @group = Group.create(group_params)
    redirect_to @group
   # else
   # 	flash[:error] = "You need to be logged in to do that"
  	# redirect_to new_group_path
  	# end
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
		 group = Group.friendly.find(params[:id])
      # logout
      group.destroy
      redirect_to groups_path
	end

end
