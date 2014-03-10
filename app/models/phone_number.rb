class PhoneNumber < ActiveRecord::Base
    belongs_to :user

    validates :number, length: {is: 10}, presence: true, format: { with: /\A[0-9]+\z/ }, uniqueness: true
end