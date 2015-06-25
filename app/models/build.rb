class Build < ActiveRecord::Base
	belongs_to :cpu
	belongs_to :cooler
	belongs_to :motherboard
	belongs_to :memory
	belongs_to :storage
	belongs_to :cpu_case
	belongs_to :video_card


	def concistency_check
		@consistancies =[]
		@conflicts = []

		def combine_report(report)
			_consistency,_conflicts=report[0],report[1]
			@consistancies.concat(_consistency)
			@conflicts.concat _conflicts
		end

		if self.cpu
			combine_report(self.cpu.report_consistency(self))
		end

		if self.cooler
			combine_report(self.cooler.report_consistency(self))
		end

		if self.motherboard
		 #combine_report(self.motherboard.report_consistency(self))
		end


		if self.memory
			combine_report(self.memory.report_consistency(self))
		end

		if self.cpu_case
		#_consistancy,_conflicts =	self.cpu_case.report_consistency(self)
		#@consistancies<<_consistancy
		#@conflicts<<_conflicts
		end

		if self.video_card
			combine_report(self.video_card.report_consistency(self))
		end


		return @consistancies, @conflicts
	end
end