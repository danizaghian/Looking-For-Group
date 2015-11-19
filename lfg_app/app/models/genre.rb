class Genre < ActiveRecord::Base
	has_many :game_genres
	has_many :games, through: :game_genres
	has_many :user_genres
	has_many :users, through: :user_genres
end
