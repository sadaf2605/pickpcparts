class Build < ActiveRecord::Base
	has_many :cpus
	has_many :coolers
	has_many :motherboards
	has_many :memories
	has_many :storages
	has_many :cpu_cases
	has_many :video_cards
	has_many :power_supplies

  def add_cpu(cpu)
		if cpu
			self.cpus<<cpu
			save
		end
	end

  def remove_cpu(cpu)
		self.cpus.delete(cpu)
		save
	end

  def add_motherboard(motherboard)
		if motherboard
			self.motherboards<<motherboard
			save
		end
	end
	
	def remove_motherboard(motherboard)
	  self.motherboards.delete(motherboard)
	  save
	end

  def add_cooler(cooler)
		if cooler
			self.coolers<<cooler
			save
		end
	end
	
	def remove_cooler(cooler)
    self.coolers.delete(cooler)
    save
  end

  def add_memory(memory)
		if memory
			self.memories<<memory
			save
		end
	end
	def remove_memory(memory)
    self.memories.delete(memory)
    save
  end

	def add_storage(storage)
		if storage
			self.storages<<storage
			save
		end
	end
  def remove_storage(storage)
    self.storages.delete(storage)
    save
  end

  def add_video_card(video_card)
		if video_card
			self.video_cards<<video_card
			save
		end
	end
  def remove_video_card(video_card)
    self.video_cards.delete(video_card)
    save
  end
  
  def add_cpu_case(cpu_case)
		if cpu_case
			self.cpu_cases<<cpu_case
			save
		end
	end
  def remove_cpu_case(cpu_case)
    self.cpu_cases.delete(cpu_case)
    save
  end

  def add_power_supply(power_supply)
		if power_supply
			self.power_supplies<<power_supply
			save
		end
	end
	 def remove_power_supply(power_supply)
    self.power_supplies.delete(power_supply)
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

		self.cpus do |cpu|
			combine_report(cpu.report_consistency(self))
		end

		self.coolers do |cooler|
			combine_report(cooler.report_consistency(self))
		end

		self.motherboards do |motherboard|
		 combine_report(motherboard.report_consistency(self))
		end


		self.memories do |memory|
			combine_report(memory.report_consistency(self))
		end

		self.cpu_cases do |cpu_case|
		#_consistancy,_conflicts =	self.cpu_case.report_consistency(self)
		#@consistancies<<_consistancy
		#@conflicts<<_conflicts
		end

		self.video_cards do |video_card|
			combine_report(video_card.report_consistency(self))
		end


		return @consistancies, @conflicts
	end
end