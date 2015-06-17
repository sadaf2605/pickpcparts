class Motherboard < ActiveRecord::Base
	belongs_to :cpu_socket
	has_many :build
	belongs_to :memory_slot

	def supports_cpu(cpu)
		return cpu.supports_motherboard(self)
	end

	def supports_cooler(cooler)
		return cooler.supports_motherboard(self)
	end

	def supports_case(cpu_case)
		raise "yet to implement"
		return true
	end

	def supports_memory(memory)
		return memory_slot==memory.memory_type
	end

	def supports_optical_drive(drive)
		raise "yet to implement"
		return true
	end

	def supports_sound_card(sound_card)
		raise "yet to implement"
		return true
	end

	def supports_storage(storage)
		"it only checks sata port, need to support PATA as well"
		return self.sata_6_gbs > 0 && storage.interface == "SATA 6 Gb/s"
	end

	def supports_video_card(video_card)
		return video_card supports_motherboard self
	end

	def supports_wired_network_adapter(wired_network_adapter)
		raise "yet to implement"
		return true
	end
	def supports_wireless_network_adapters(wireless_network_adapters)
		raise "yet to implement"
		return true
	end


end
