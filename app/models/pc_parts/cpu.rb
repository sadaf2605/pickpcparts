class Cpu < ParentProduct
  has_many :cpu_builds
  has_many :builds, :through => :cpu_builds  
  belongs_to :cpu_socket

#  validates :cpu_socket ,presence: true

  
  
  def supports_cooler(cooler)
    return cooler.supports_cpu(self)
  end
  
  def supports_motherboard(motherboard)
    if motherboard.nil?
      return "[incompatible] Motherboard is not attached"
    elsif motherboard.cpu_socket == self.cpu_socket
      return "[compatible] Motherboard supports CPU socket #{self.cpu_socket.name}"
    else
      return "[incompatible] Cpu supports socket #{cpu_socket.name} but Motherboard supports socket #{motherboard.cpu_socket.name}."
    end
  end  
end
