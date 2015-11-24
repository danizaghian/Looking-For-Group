class UserGenresController < ApplicationController
	def show
		@user = current_user
		@genres = @user.genres
		@groups = []
		@genres.each do |genre|
			genre.groups.each do |group|
				@groups << group unless @groups.include? group or group.users.include? current_user
			end
		end

	end
end
