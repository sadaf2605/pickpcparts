class PowerSupply < ActiveRecord::Base
  has_and_belongs_to_many :builds

	def supports_cpu_cases(cpu_case)
		raise "yet to implement"
		return true
	end
	def supports_video_card(video)
		raise "yet to implement"
		return true
	end
end
