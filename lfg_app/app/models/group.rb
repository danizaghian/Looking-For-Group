class Group < ActiveRecord::Base
	has_many :group_users
	has_many :users, through: :group_users
	belongs_to :games
	has_many :genres, through: :games

		extend FriendlyId
		friendly_id :name, use: :slugged
		
end
