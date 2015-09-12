class Foundation < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :logo, presence: true
end
