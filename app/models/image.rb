class Image < ApplicationRecord
  mount_uploader :image, PictureUploader
  belongs_to :item
end
