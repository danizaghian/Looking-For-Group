class User < ActiveRecord::Base
	has_many :group_users
	has_many :groups, through: :group_users

	has_secure_password

    def self.confirm(params)
      @user = User.find_by({email: params[:email]})
      @user.try(:authenticate, params[:password])
    end

	extend FriendlyId
	friendly_id :username, use: :slugged 
end
