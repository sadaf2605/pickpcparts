class PowerSupply < ActiveRecord::Base


	def supports_cpu_cases(cpu_case)
		raise "yet to implement"
		return true
	end
	def supports_video_card(video)
		raise "yet to implement"
		return true
	end
end
