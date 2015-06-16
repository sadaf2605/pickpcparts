class VideoCard < ActiveRecord::Base
	belongs_to :build


	def supports_video_card(pc_case)
		return pc_case.length >= self.length
	end

	def supports_motherboard(motherboard)

		"It does for PCIe"
		if self.crossfire_support || self.sli_support
			return motherboard.sli_support || motherboard.crossfire_support
		end
			return false
	end

end
