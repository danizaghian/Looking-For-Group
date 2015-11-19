class User < ActiveRecord::Base
	has_many :group_users
	has_many :groups, through: :group_users
	has_many :user_genres
	has_many :genres, through: :user_genres

	has_secure_password

	has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44#" },
                    :default_url => "/images/:style/missing.png"

  	validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..1000.kilobytes }

    def self.confirm(params)
      @user = User.find_by({email: params[:email]})
      @user.try(:authenticate, params[:password])
    end

	extend FriendlyId
	friendly_id :username, use: :slugged 
end
