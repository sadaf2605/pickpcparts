class Shop < ActiveRecord::Base
  mount_uploader :avatar, ProductImageUploader
  has_many :market_statuses
#  has_many :products, :through => :market_statuses
end