class MarketStatus < ActiveRecord::Base
  belongs_to :shop
  belongs_to :product
end
