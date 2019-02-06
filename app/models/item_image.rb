class ItemImage < ApplicationRecord
  mount_uploader :name, ImageUploader
  belongs_to :product, optional: true
end
