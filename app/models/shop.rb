class Shop < ActiveRecord::Base
  has_many :market_statuses
#  has_many :products, :through => :market_statuses
end