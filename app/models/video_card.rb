class VideoCard < ActiveRecord::Base
	belongs_to :build


	def supports_pc_case(pc_case)
		raise "yet to implement"
		return true
	end
	def supports_motherboard(motherboard)
		raise "yet to implement"
	end
	def supports_power_supply(power_supply)
		raise "yet to implement"
	end
end
