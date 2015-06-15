class Cooler < ActiveRecord::Base
	has_and_belongs_to_many :cpu_sockets
	has_many :build

	def supports_cpu(cpu)
		return self.cpu_sockets.include? cpu.cpu_socket
	end

	def supports_cases(pc_cases)
		raise 'not implemented'
		return true
	end
	def supports_motherboard(motherboard)
		return self.cpu_sockets.include? motherboard.cpu_socket
	end

end
