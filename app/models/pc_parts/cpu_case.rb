class CpuCase < PcPart
  has_many :cpu_case_builds
	has_many :builds, :through => :cpu_case_builds

	has_many :cpu_case_form_factor_membership
	has_many :form_factors, class: FormFactor, :through => :cpu_case_form_factor_membership

	attr_accessor :dimensions
	attr_accessor :form_factor

end
