class Motherboard < ParentProduct
  belongs_to :product
  
	has_many :motherboard_builds
	has_many :builds, :through => :motherboard_builds
	
	
	belongs_to :cpu_socket
	
	
	belongs_to :memory_slot
	belongs_to :form_factor

	attr_accessor :form_factor_str
	
  
  
  

	def supports_cpu(cpu)
		return cpu.supports_motherboard(self)
	end

	def supports_cooler(cooler)
		return cooler.supports_motherboard(self)
	end

	def supports_cpu_case(cpu_case)
		return cpu_case.supports_motherboard(self)
	end

	def supports_memory(memory)
		if memory_slot==memory.memory_type
		  return "[compatible] motherboard and memory are compatible, both supports #{memory_slot}"
		else
		  return "[uncompatible] motherboard and memory are uncompatible, motherboard has a memory slot of #{memory_slot} and memory supports #{memory.memory_type}"
		end
	end

	def _supports_optical_drive(drive)
		#todo
		#raise "yet to implement"
		return "[unchecked] Motherboard support for Optical drive unchecked!"
	end

	def _supports_sound_card(sound_card)
		#todo
		#raise "yet to implement"
    return "[unchecked] Moherboard support for Sound card unchecked!"
	end

	def supports_storage(storage)
		# todo it only checks sata port, need to support PATA as well
		
		if self.sata_6_gbs > 0
		  return "[compatible] motherboard has sata port"
		else
		  return "[uncompatible] motherboard does not have any sata port"
		end
		
		if storage.interface == "SATA 6 Gb/s"
		  return "[compatible] motherboard supports SATA 6Gb/s"
		else
		  return "[uncompatible] motherboard does not support SATA 6Gb/s"
		end
	end

	def supports_video_card(video_card)
		return video_card supports_motherboard(self)
	end

	def _supports_wired_network_adapter(wired_network_adapter)
		#todo wired network
		return "[unchecked] motherboard support for wired network adapter unchecked"
	end
	def _supports_wireless_network_adapters(wireless_network_adapters)
		#todo wireless network
		return "[unchecked] motherboard support for wireless network adapter unchecked"
	end
end
