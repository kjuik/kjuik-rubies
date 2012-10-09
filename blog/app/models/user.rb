class User < ActiveRecord::Base
	attr_accessible :nick, :admin, :password, :password_confirmation
	acts_as_authentic do |c|
		c.login_field = :nick
	end
	has_many :posts, :dependent => :delete_all
	has_many :comments, :dependent => :delete_all
end
