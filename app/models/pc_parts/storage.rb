class Storage < ParentProduct
  has_many :storage_builds
  has_many :builds, :through => :storage_builds
  

	def supports_cpu_case(pc_case)
		if self.form_factor=="3.5\""
			return pc_case.EXTERNAL_3_5_BAYS >0 || INTERNAL_3_5_BAYS >0
		else
			return false
		end
	end

	def supports_motherboard(motherboard)
		return motherboard.supports_storage(self)
	end

end
