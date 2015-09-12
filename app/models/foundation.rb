class Foundation < ActiveRecord::Base
  mount_uploader :logo, LogotypeUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :logo, presence: true
end
