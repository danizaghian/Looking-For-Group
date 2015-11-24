class UserGenresController < ApplicationController
	def show
		@user = current_user
		@genres = @user.genres
		@groups = []
		@genres.each do |genre|
			genre.groups.each do |group|
				if @groups.include? group or group.users.include? @user
				else
					@groups << group
				end
			end
		end

	end
end
