class Memory < ActiveRecord::Base
	belongs_to :memory_type, class_name: MemorySlot, foreign_key: "memory_slot_id"
	has_many :builds

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
		if supports_motherboard(build.motherboard)
			consistancies << "memory and motherboard both supports each other"
		else
			conflicts << "memory does not support motherboard"
		end
		return consistancies, conflicts
	end
end