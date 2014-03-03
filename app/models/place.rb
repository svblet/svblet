class Place < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  accepts_nested_attributes_for :photos
  # TODO: Perhaps add validation for length (e.g. minimums, maximums
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :location
  validates_presence_of :price # Validate format; but consider options; e.g. dollar signs allowed, allowing a price range, etc.
  # TODO: Perhaps later add "[Please] contact buyer" option that is inserted into textfield upon button click
end
