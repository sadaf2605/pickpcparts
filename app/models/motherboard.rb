class Motherboard < ActiveRecord::Base
	belongs_to :cpu_socket
	has_many :build
	belongs_to :memory_slot

	def supports_memory(memory)
		return memory_slot==memory.memory_type
	end
end
