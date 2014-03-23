class Place < ActiveRecord::Base
  MAX_TITLE_LENGTH = 60
  MAX_DESCRIPTION_LENGTH = 500
  MAX_CITY_LENGTH = 20

  belongs_to :user
  has_many :photos
  accepts_nested_attributes_for :photos
  # TODO: Perhaps add validation for length (e.g. minimums, maximums
  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
  validates :description, presence: true, length: { maximum: MAX_DESCRIPTION_LENGTH }
  validates :looking_for, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 } # Validate format; but consider options; e.g. dollar signs allowed, allowing a price range, etc.
  # TODO: Perhaps later add "[Please] contact buyer" option that is inserted into textfield upon button click

  validates :city, presence: true, length: { maximum: MAX_CITY_LENGTH }
  validates :province, presence: true, length: { is: 2 }
end