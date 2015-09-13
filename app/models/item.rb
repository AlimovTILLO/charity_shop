class Item < ActiveRecord::Base
  CHARITIES = [50 , 100]

  belongs_to :user
  belongs_to :foundation
  mount_uploader :thumbnail, ThumbnailUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :foundation_id, presence: true
  validates :charity, inclusion: CHARITIES
end
