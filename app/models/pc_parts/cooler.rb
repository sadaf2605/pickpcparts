class Cooler < PcPart
  has_many :cooler_builds
  has_many :builds, :through => :cooler_builds
	
	has_and_belongs_to_many :cpu_sockets
	
	def build_with_market_status(params)
    Product.build_with_market_status(self,params[:cooler])
  end


      def supports_cpu(cpu)
        if cpu.nil?
          return "[uncompatable] No cpu attached!"
        elsif self.cpu_sockets.include? cpu.cpu_socket
          return "[compatable] CPU socket "+cpu.cpu_socket.name+" supports cooler!"
        else
          return "[uncompatable] Cooler supports socket #{self.cpu_sockets} but cpu is of #{cpu.cpu_socket.name}"
        end
      end
    
      def supports_cases(pc_cases)
        if pc_cases.nil?
          return "[uncompatable] No pc cases attached!" 
        else          #todo
          #raise "not implemented"
          return "[compatable] Not implemented!"
        end
      end
    
      def supports_motherboard(motherboard)
        if motherboard.nil?
          return "[uncompatable] No motherboard attached!"
        elsif self.cpu_sockets.include? motherboard.cpu_socket
          return "[compatable] Cpu socket "+self.cpu_sockets.name+" supports motherboard"
        else
          return "[uncompatable] Cooler supports socket #{self.cpu_sockets} but motherboard is of #{motherboard.cpu_socket.name}"
        end
        
      end
end
  