class PowerSupply < ParentProduct

  has_many :power_supply_builds
  has_many :builds, :through => :power_supply_builds, class_name: Build

	def supports_cpu_cases(cpu_case)
		#raise "yet to implement"
		return true
	end
	def supports_video_card(video)
		#raise "yet to implement"
		return true
	end
end
