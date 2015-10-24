class OpticalDriveBuild < ActiveRecord::Base
	belongs_to :optical_drive
	belongs_to :market_status
#	has_many :builds
end
