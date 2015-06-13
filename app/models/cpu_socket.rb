class CpuSocket < ActiveRecord::Base
	has_many :cpus
	has_and_belongs_to_many :coolers
	has_many :motherboards
end
