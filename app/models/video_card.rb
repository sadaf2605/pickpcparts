class VideoCard < ActiveRecord::Base
	has_and_belongs_to_many :builds


	def supports_case(cpu_case)
		if cpu_case.nil? || self.length.nil?
			return false
		else
			return cpu_case.length >= self.length
		end
	end

	def supports_motherboard(motherboard)

		"It does for PCIe"
		if self.crossfire_support || self.sli_support
			return motherboard.sli_support || motherboard.crossfire_support
		end
			return false
	end

	def report_consistency(build)
		consistancies=[]
		conflicts=[]

		if supports_case(build.cpu_case)
			consistancies << "video card supports cpu case length"
		else
			conflicts << "Video card needs at least length at case "
		end


		if supports_motherboard(build.motherboard)
			consistancies << "video card supports motherboard"
		else
			conflicts << "Video card does not support"
		end

		return consistancies,conflicts
	end

end
