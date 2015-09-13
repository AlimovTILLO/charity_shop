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

  def commission
    (price * 0.15).to_i
  end

  def commissioned_price
    price - commission
  end

  def charity_value
    (commissioned_price * (charity/100.0)).to_i
  end

  def seller_value
    r = commissioned_price - charity_value
    if r == 0
      'Rahmat!'
    else
      r
    end
  end
end
