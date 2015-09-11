class Cooler < ParentProduct
  has_many :cooler_builds
  has_many :builds, :through => :cooler_builds

	
	has_and_belongs_to_many :cpu_sockets
	
      def supports_cpu(cpu)
        if cpu.nil?
          return msg_not_attached("Cpu")
        elsif cpu_sockets.include? cpu.cpu_socket
          return msg_socket_supported("Cooler","Cpu",cpu.cpu_socket) 
        else
          return msg_socket_not_supported("Cooler", cpu_sockets, "Cpu", cpu.cpu_socket) 
        end
      end
    
      def supports_cpu_case(pc_cases)
        if pc_cases.nil?
          return msg_not_attached("Cpu Case")
        else          #todo
          #raise "not implemented"
          return msg_not_checked("Cpu Case","Cooler")
        end
      end
    
      def supports_motherboard(motherboard)
        if motherboard.nil?
          return msg_not_attached("Motherboard")
        elsif self.cpu_sockets.include? motherboard.cpu_socket
          return msg_socket_supported("Cooler","Motherboard",motherboard.cpu_socket)
        else
          return msg_socket_not_supported("Cooler", cpu_sockets, "Motherboard", motherboard.cpu_socket)
        end
        
      end
end
  