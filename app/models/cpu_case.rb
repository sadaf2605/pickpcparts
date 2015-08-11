class CpuCase < ActiveRecord::Base
  belongs_to :product
  has_many :cpu_case_builds
	has_many :builds, :through => :cpu_case_builds
	
	has_many :motherboard_compatibility, class_name: :FormFactor
	accepts_nested_attributes_for :motherboard_compatibility

	attr_accessor :dimensions
	attr_accessor :form_factor
	

end
