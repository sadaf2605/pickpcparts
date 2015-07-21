class Build < ActiveRecord::Base
  has_many :cpu_builds
  has_many :cpus, :through => :cpu_builds
  
  has_many :cooler_builds
  has_many :coolers, :through => :cooler_builds
  
  has_many :motherboard_builds
  has_many :motherboards, :through => :motherboard_builds
    
    
	has_many :memory_builds
	has_many :memories, :through => :memory_builds
	
	has_many :storage_builds
  has_many :storages, :through => :storage_builds

  has_many :cpu_case_builds
  has_many :cpu_cases, :through => :cpu_case_builds

  has_many :video_card_builds
  has_many :video_cards, :through => :video_card_builds

  has_many :power_supply_builds
  has_many :power_supplies, :through => :power_supply_builds
  

  def add_cpu(cpu)
		if cpu
			self.cpus<<cpu
			save
		end
	end

  def remove_cpu(cpu)
    CpuBuild.where("cpu_id = ? AND build_id = ?", cpu.id, self.id).first.delete
#		self.cpus.delete(cpu)
		save
	end

  def add_motherboard(motherboard)
		if motherboard
			self.motherboards<<motherboard
			save
		end
	end
	
	def remove_motherboard(motherboard)
	  MotherboardBuild.where("motherboard_id = ? AND build_id = ?", motherboard.id, self.id).first.delete
	  save
	end

  def add_cooler(cooler)
		if cooler
			self.coolers<<cooler
			save
		end
	end
	
	def remove_cooler(cooler)
    CoolerBuild.where("cooler_id = ? AND build_id = ?", cooler.id, self.id).first.delete
    save
  end

  def add_memory(memory)
		if memory
			self.memories<<memory
			save
		end
	end
	def remove_memory(memory)
	  MemoryBuild.where("memory_id = ? AND build_id = ?", memory.id, self.id).first.delete
    save
  end

	def add_storage(storage)
		if storage
			self.storages<<storage
			save
		end
	end
  def remove_storage(storage)
    StorageBuild.where("storage_id = ? AND build_id = ?", storage.id, self.id).first.delete
    save
  end

  def add_video_card(video_card)
		if video_card
			self.video_cards<<video_card
			save
		end
	end
  def remove_video_card(video_card)
    VideoCardBuild.where("video_card_id = ? AND build_id = ?", video_card.id, self.id).first.delete    
    save
  end
  
  def add_cpu_case(cpu_case)
		if cpu_case
			self.cpu_cases<<cpu_case
			save
		end
	end
  def remove_cpu_case(cpu_case)
    CpuCaseBuild.where("cpu_case_id = ? AND build_id = ?", cpu_case.id, self.id).first.delete
    save
  end

  def add_power_supply(power_supply)
		if power_supply
			self.power_supplies<<power_supply
			save
		end
	end
	 def remove_power_supply(power_supply)
    PowerSupplyBuild.where("power_supply_id = ? AND build_id = ?", power_supply.id, self.id).first.delete
    save
  end

	def concistency_check
		@consistancies =[]
		@conflicts = []

		def combine_report(report)
			_consistency,_conflicts=report[0],report[1]
			@consistancies.concat(_consistency)
			@conflicts.concat _conflicts
		end

		self.cpus.each do |cpu|
			combine_report(cpu.report_consistency(self))
		end

		self.coolers.each do |cooler|
			combine_report(cooler.report_consistency(self))
		end

		self.motherboards.each do |motherboard|
		 combine_report(motherboard.report_consistency(self))
		end


		self.memories.each do |memory|
			combine_report(memory.report_consistency(self))
		end

		self.cpu_cases.each do |cpu_case|
		#_consistancy,_conflicts =	self.cpu_case.report_consistency(self)
		#@consistancies<<_consistancy
		#@conflicts<<_conflicts
		end

		self.video_cards.each do |video_card|
			combine_report(video_card.report_consistency(self))
		end


		return @consistancies, @conflicts
	end
end