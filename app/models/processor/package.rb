class Processor::Package < ActiveRecord::Base
  belongs_to :cpu_socket
end
