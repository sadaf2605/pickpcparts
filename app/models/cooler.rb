class Cooler < ActiveRecord::Base
  has_many :cooler_builds
  has_many :builds, :through => :cooler_builds
	
	has_and_belongs_to_many :cpu_sockets

	def supports_cpu(cpu)
		if cpu.nil?
			return false
		else
			return self.cpu_sockets.include? cpu.cpu_socket
		end
	end

	def supports_cases(pc_cases)
		if pc_cases.nil?
			return false
		else
			#todo
			#raise "not implemented"
			return true
		end
	end

	def supports_motherboard(motherboard)
		if motherboard.nil?
			return false
		else
			return self.cpu_sockets.include? motherboard.cpu_socket
		end
	end

	def report_consistency(build)
		consistancy=[]
		conflict=[]
		
		
		build.cpus do |cpu|
  		if self.supports_cpu(cpu)
  			consistancy << "Cooler and cpu both supports socket "+build.cpu.cpu_socket
  		else
  			conflict << "Cooler does not support socket of cpu, socket "+build.cpu.cpu_socket
  		end
  	end

    build.cpu_case do |cpu_case|
  		if self.supports_cases(cpu_case)
  			consistancy << "Cooler and case supports form factor "
  		else
  			conflict << "Cooler does not support form factor of case"
  		end
  	end
  	
    build.motherboards do |motherboard|
  		if self.supports_motherboard(motherboard)
  			consistancy << "Cooler and motherboard both supports socket "+build.cpu.cpu_socket
  		else
  			conflict << "Cooler does not support socket of motherboard, socket "+build.cpu.cpu_socket
  		end
  	end
  	
		return consistancy, conflict
	end

end
