class Place < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  accepts_nested_attributes_for :photos
  # TODO: Perhaps add validation for length (e.g. minimums, maximums
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :looking_for, presence: true
  validates :price, presence: true # Validate format; but consider options; e.g. dollar signs allowed, allowing a price range, etc.
  # TODO: Perhaps later add "[Please] contact buyer" option that is inserted into textfield upon button click
end