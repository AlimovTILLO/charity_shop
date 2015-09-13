class Item < ActiveRecord::Base
  CHARITIES = [50 , 100]

  belongs_to :user
  belongs_to :foundation
  mount_uploader :thumbnail, ThumbnailUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :foundation_id, presence: true
  validates :charity, presence: true, inclusion: CHARITIES

  def self.charity_options
    options_for_select(Array[*CHARITIES.collect {|v| [v, CHARITIES.index(v)] }])
  end

  def charity_value
    (price * (charity/100.0)).to_i
  end

  def profit_value
    price - charity_value
  end
end
