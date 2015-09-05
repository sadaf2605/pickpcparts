class CpuSocket < ActiveRecord::Base
	has_many :cpus
	has_many :coolers
	has_many :motherboards


	def to_str
		return self.name
	end
end
