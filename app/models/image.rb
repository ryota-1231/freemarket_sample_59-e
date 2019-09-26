class Image < ApplicationRecord
  mount_uploader :image, PictureUploader
end
