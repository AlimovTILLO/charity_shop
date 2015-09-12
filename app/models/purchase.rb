class Purchase < ActiveRecord::Base
  validates :seller_id, presence: true
  validates :buyer_id, presence: true
  validates :item_id, presence: true
  validates :price, presence: true
end
