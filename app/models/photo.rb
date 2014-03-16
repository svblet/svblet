class Photo < ActiveRecord::Base
  belongs_to :place
  mount_uploader :image, ImageUploader
  dragonfly_accessor :image

  before_create :default_name

  def default_name
    self.name ||= File.basename(image.name, '.*').titleize if image
  end

  def thumbnail
    image.thumb('400x200#').url if image_stored?
  end
end
