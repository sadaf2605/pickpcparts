class CpuSocket < ActiveRecord::Base
	has_many :cpus
	has_and_belongs_to_many :coolers
	has_many :motherboards


	def to_str
		return self.name
	end
end
