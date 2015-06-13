class Cooler < ActiveRecord::Base
	has_and_belongs_to_many :cpu_sockets
end
