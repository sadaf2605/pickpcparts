class Cooler < ActiveRecord::Base
	has_and_belongs_to_many :cpu_sockets
	has_many :build

	def supports_cpu(cpu)
		return self.cpu_sockets.include? cpu.cpu_socket
	end

	def supports_cases(pc_cases)
		return pc_cases.motherboard_compatibility.include? self.form_factor
	end
	def supports_motherboard(motherboard)
		return self.cpu_sockets.include? motherboard.cpu_socket
	end

end
