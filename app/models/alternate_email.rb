class AlternateEmail < ActiveRecord::Base
	belongs_to :user
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
	    format: { with: VALID_EMAIL_REGEX }, 
	    uniqueness: { case_sensitive: false }

    before_save { |alternate_email| alternate_email.email = email.downcase }
end
