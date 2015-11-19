class Game < ActiveRecord::Base
	has_many :game_genres
	has_many :genres, through: :game_genres
	has_many :groups


	extend FriendlyId
		friendly_id :name, use: :slugged

end
