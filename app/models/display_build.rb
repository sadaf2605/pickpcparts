class DisplayBuild < ActiveRecord::Base
	belongs_to :display
	belongs_to :market_status
end
