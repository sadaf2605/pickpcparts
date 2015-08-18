class MarketStatus < ActiveRecord::Base
  belongs_to :shop
  has_one :product
end
