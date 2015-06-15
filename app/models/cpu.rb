class Cpu < ActiveRecord::Base
	belongs_to :cpu_socket
	has_many :build
	

	def supports_cooler(cooler)
		return cooler.cpu_sockets.include? self.cpu_socket 
	end

	def supports_motherboard(motherboad)
		return motherboad.cpu_socket==self.cpu_socket
	end


end
