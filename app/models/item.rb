class Item < ActiveRecord::Base
  mount_uploader :thumbnail, ThumbnailUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
end
