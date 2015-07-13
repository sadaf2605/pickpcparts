class Cpu < ActiveRecord::Base
  belongs_to :cpu_socket

  attr_accessor :cpu_socket_str

  def supports_cooler(cooler)
    
    if cooler.nil?
      return false
    else
      return cooler.cpu_sockets.include? self.cpu_socket
    end

  end
  def supports_motherboard(motherboard)
    if motherboard.nil?
      return false
    else
      return motherboard.cpu_socket == self.cpu_socket
    end
  end


  def report_consistency(build)
    consistancies=[]
    conflicts=[]

    if supports_cooler(build.cooler)
        consistancies << "cpu and cooler both support socket " + self.cpu_socket.name
    else
        conflicts << "cpu and cooler has conflicted on socket " + self.cpu_socket.name
    end


    if supports_motherboard(build.motherboard)
      consistancies << "cpu and motherboard both support socket " + self.cpu_socket.name
    else
      conflicts << "cpu and motherboard has conflicted on socket " + self.cpu_socket.name
      conflicts << "cpu only support" + self.cpu.cpu_socket.name
    end


    return consistancies,conflicts
  end


end
