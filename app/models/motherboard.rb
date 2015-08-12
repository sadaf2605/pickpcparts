class Motherboard < ActiveRecord::Base
  belongs_to :product
  
	has_many :motherboard_builds
	has_many :builds, :through => :motherboard_builds
	
	
	belongs_to :cpu_socket
	
	
	
	belongs_to :memory_slot
	belongs_to :form_factor

	attr_accessor :form_factor_str
	
	def build_with_market_status(params)
    Product.build_with_market_status(self,params[:motherboard])
  end

	def supports_cpu(cpu)
		return cpu.supports_motherboard(self)
	end

	def supports_cooler(cooler)
		return cooler.supports_motherboard(self)
	end

	def supports_case(cpu_case)
		return cpu_case.supports_motherboard(self)
	end

	def supports_memory(memory)
		return memory_slot==memory.memory_type
	end

	def supports_optical_drive(drive)
		#todo
		#raise "yet to implement"
		return true
	end

	def supports_sound_card(sound_card)
		#todo
		#raise "yet to implement"
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
		#todo
		#raise "yet to implement"
		return true
	end
	def supports_wireless_network_adapters(wireless_network_adapters)
		#todo
		#raise "yet to implement"
		return true
	end

  def report_consistency(build)
    #todo
    #raise "yet to implement"
    consistancies=[]
    conflicts=[]
     return consistancies,conflicts
  end
end
