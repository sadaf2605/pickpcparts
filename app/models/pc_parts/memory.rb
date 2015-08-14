class Memory < PcPart
	belongs_to :memory_type, class_name: MemorySlot, foreign_key: "memory_slot_id"
	
	has_many :memory_builds
	has_many :builds, :through => :memory_builds
	
	def build_with_market_status(params)
    Product.build_with_market_status(self,params[:memory])
  end
	

	def supports_motherboard(motherboard)
		if motherboard.nil?
			return "[uncompatible] no motherboard attached"
		else
			return motherboard.supports_memory(self)
		end
	end

end