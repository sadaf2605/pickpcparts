class PowerSupplyBuild < ActiveRecord::Base
  belongs_to :power_supply
  belongs_to :builds
end
