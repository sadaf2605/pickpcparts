class CpuCase < ActiveRecord::Base
	has_many :builds
	has_many :motherboard_compatibility, class_name: :FormFactor
	accepts_nested_attributes_for :motherboard_compatibility

	attr_accessor :dimensions
	attr_accessor :form_factor
	
	has_and_belongs_to_many :builds

end
