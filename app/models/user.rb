class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
				format: { with: VALID_EMAIL_REGEX }, 
				uniqueness: { case_sensitive: false }

	# to ensure that non unique emails are also caught at the database level
	# see migration: add_index_to_users_email
	before_save { |user| user.email = email.downcase }
end
