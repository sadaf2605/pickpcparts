class Cpu < ActiveRecord::Base
  belongs_to :cpu_socket

  def supports_cooler(cooler)
    return cooler.cpu_sockets.include? self.cpu_socket
  end
  def supports_motherboard(motherboard)
    return motherboard.cpu_socket == self.cpu_socket
  end

end
