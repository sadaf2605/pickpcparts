class Product < ActiveRecord::Base
  mount_uploader :avatar, ProductImageUploader
  
  has_many :market_statuses
  accepts_nested_attributes_for :market_statuses, :allow_destroy => true

  has_many :product_pictures
  has_many :pictures, through: :product_pictures
  accepts_nested_attributes_for :product_pictures, :allow_destroy => true
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end