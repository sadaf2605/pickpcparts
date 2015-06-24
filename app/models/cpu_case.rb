class CpuCase < ActiveRecord::Base
	has_many :builds
	has_many :motherboard_compatibility, class_name: :FormFactor
	attr_accessor :dimensions
	attr_accessor :form_factor

end
