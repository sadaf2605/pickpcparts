class Cpu < PcPart
  has_many :cpu_builds
  has_many :builds, :through => :cpu_builds  
  belongs_to :cpu_socket

#  validates :cpu_socket ,presence: true

  
  
  def supports_cooler(cooler)
    return cooler.supports_cpu(self)
  end
  
  def supports_motherboard(motherboard)
    if motherboard.nil?
      return msg_not_attached("Motherboard")
    elsif motherboard.cpu_socket == self.cpu_socket
      return msg_socket_supported("Cpu","Motherboard",self.cpu_socket)
    else
      return msg_socket_not_supported("Cpu",cpu_socket,"Motherboard", motherboard.cpu_socket)
    end
  end  
end
