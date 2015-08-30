class Product < ActiveRecord::Base
  mount_uploader :avatar, ProductImageUploader
  has_many :market_statuses
  accepts_nested_attributes_for :market_statuses, :allow_destroy => true
end