class Cpu < ActiveRecord::Base
  has_many :cpu_builds
  has_many :builds, :through => :cpu_builds
  
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
    
    build.coolers.each do |cooler|
      if supports_cooler(cooler)
          consistancies << "cpu and cooler both support socket " + self.cpu_socket.name
      else
          conflicts << "cpu and cooler has conflicted on socket " + self.cpu_socket.name
      end
    end

    build.motherboards.each do |motherboard|
      if supports_motherboard(motherboard)
        consistancies << "cpu and motherboard both support socket " + self.cpu_socket.name
      else
        conflicts << "cpu and motherboard has conflicted on socket " + self.cpu_socket.name
        conflicts << "cpu only support" + self.cpu_socket.name
      end
    end

    return consistancies,conflicts
  end


end
