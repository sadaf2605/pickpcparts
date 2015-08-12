class MarketStatusController < ApplicationController
      def self.market_status_params(p=params)
        p.permit(:shop_id, :price)
      end
end
