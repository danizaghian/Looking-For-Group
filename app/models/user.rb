class User < ActiveRecord::Base
	has_many :group_users, dependent: :destroy
	has_many :groups, through: :group_users
	has_many :user_genres
	has_many :genres, through: :user_genres
  has_many :user_games
  has_many :games, through: :user_games
  validates :username, uniqueness: true
  validates :username, presence: true 
  validates :email, uniqueness: true
  validates :email, presence: true 
  validates :city, length: { is: 5 }
  acts_as_messageable
	has_secure_password

	has_attached_file :avatar,
                    :styles => { :large => "400x400#", :medium => "250x200#", :thumb => "125x125#" }, 
                    :storage => :s3,
                    :default_url => "/images/kench1_:style.jpg",
                    :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                    :path => "avatars/:id/:style/avatar.:extension",
                    :url => ":s3_domain_url"

def s3_credentials
  { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
end


  	validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..1000.kilobytes }

    def self.confirm(params)
      @user = User.find_by({username: params[:username]})
      @user.try(:authenticate, params[:password])
    end


  def name
   return @username
  end

    def mailboxer_email(object)
    #Check if an email should be sent for that object
     #if true
    return @email
      #if false
     #return nil
end


	extend FriendlyId
	friendly_id :username, use: :slugged 
end
