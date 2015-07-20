class Memory < ActiveRecord::Base
	belongs_to :memory_type, class_name: MemorySlot, foreign_key: "memory_slot_id"
	
	has_many :memory_builds
	has_many :builds, :through => :memory_builds
	

	def supports_motherboard(motherboard)
		if motherboard.nil?
			return false
		else
			return motherboard.supports_memory(self)
		end
	end

  def report_consistency(build)
		consistancies=[]
		conflicts=[]
		
		self.motherboards do |motherboard|
  		if supports_motherboard(motherboard)
  			consistancies << "memory and motherboard both supports each other"
  		else
  			conflicts << "memory does not support motherboard"
  		end
  	end
  	
		return consistancies, conflicts
	end
end