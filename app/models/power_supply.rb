class PowerSupply < ActiveRecord::Base
  
  belongs_to :product
  has_many :power_supply_builds
  has_many :builds, :through => :power_supply_builds, class_name: Build
  
  def build_with_market_status(params)
    Product.build_with_market_status(self,params[:power_supply])
  end

	def supports_cpu_cases(cpu_case)
		#raise "yet to implement"
		return true
	end
	def supports_video_card(video)
		#raise "yet to implement"
		return true
	end
end
