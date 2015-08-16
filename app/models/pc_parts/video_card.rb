class VideoCard < ParentProduct
	has_many :video_card_builds
	has_many :builds, :through => :video_card_builds
  
	def supports_case(cpu_case)
		if cpu_case.nil? || self.length.nil?
			return "[Uncopatible] No cpu case attached!"
		elsif cpu_case.length >= self.length
		  return "[Compitable] Video card is capbitable with case, case length is #{cpu_case.length} which is greater than #{self.length}"
		end
	end

	def supports_motherboard(motherboard)

		"It does for PCIe"
		if self.crossfire_support || self.sli_support
			if motherboard.sli_support || motherboard.crossfire_support
			  return "[Compatible] Video card is compatible with motherboard, both supports either SLI or Crossfire"
			else
			  return "[Uncompatible] Video card supports either SLI or Crossfire but motherboard does not"
			end
		end
    return "[Uncompatible] Video card does not support SLI or Crossfire"
	end

end
