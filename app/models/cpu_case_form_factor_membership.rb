class CpuCaseFormFactorMembership < ActiveRecord::Base
	belongs_to :cpu_case
	belongs_to :form_factor
end

