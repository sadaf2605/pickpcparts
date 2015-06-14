class Build < ActiveRecord::Base
	belongs_to :cpu
	belongs_to :cooler
	belongs_to :motherboard
	belongs_to :memory

	def concistency_check
		@consistancies =[]
		@conflicts = []
		if self.cpu.supports_motherboard self.motherboard
	      @consistancies << "cpu and motherboard both supports socket " + self.cpu.cpu_socket.name
	    else
	      @conflicts << "cpu and motherboard has conflict on socket " + self.cpu.cpu_socket.name     
	    end


	    if self.cooler.supports_motherboard self.motherboard
	      @consistancies << "cpu and cooler both supports socket " + self.cpu.cpu_socket.name  
	    else
	      @conflicts << "cpu and cooler has conflicts on socket " + self.cpu.cpu_socket.name
	      @conflicts << "cooler only supports: "+self.cooler.cpu_sockets.map{|i| i.name}.join(",")
	    end

	    if self.cooler.supports_cpu self.cpu
	      @consistancies << "motherboard and cooler both supports on socket " + self.cpu.cpu_socket.name  
	    else
	      @conflicts << "motherboard and cooler has conflicts on socket " + self.cpu.cpu_socket.name
	    end

	    if self.motherboard.supports_memory self.memory
	      @consistancies << "motherboard and cooler both supports on memory slot " + self.motherboard.memory_slot.name  
	    else
	      @conflicts << "motherboard and cooler both supports on memory slot " + self.motherboard.memory_slot.name
	    end


		return @consistancies, @conflicts
	end
end