class CpuCase < ActiveRecord::Base
	has_many :builds
	attr_accessor :dimensions
end
