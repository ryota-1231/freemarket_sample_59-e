class Image < ApplicationRecord
  mount_uploaders :image, PictureUploader
  belongs_to :item, inverse_of: :images
end
