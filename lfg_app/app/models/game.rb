class Game < ActiveRecord::Base
	has_many :game_genres
	has_many :genres, through: :game_genres
	has_many :groups
	has_many :user_games
	has_many :users, through: :user_games

	extend FriendlyId
		friendly_id :name, use: :slugged

end
