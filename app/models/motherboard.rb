class Motherboard < ActiveRecord::Base
	belongs_to :cpu_socket
	has_many :build
	belongs_to :memory_slot

	def supports_memory(memory)
		return memory_slot==memory.memory_type
	end

	def supports_storage(storage)
		"it only checks sata port, need to support PATA as well"
		return self.sata_6_gbs > 0 && storage.interface == "SATA 6 Gb/s"
	end
end
