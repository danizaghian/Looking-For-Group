class Group < ActiveRecord::Base
	has_many :group_users
	has_many :users, through: :group_users
	belongs_to :games
	has_many :genres, through: :games
	# validates :name, presence: true

	has_attached_file :avatar,
                    :styles => { :large => "400x400#", :medium => "200x200#", :thumb => "70x70#" },
                    :default_url => "/images/:style/missing.png"

  	validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..1000.kilobytes }

		extend FriendlyId
		friendly_id :name, use: :slugged
		
end
