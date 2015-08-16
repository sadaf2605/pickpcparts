class AddMarketStatusIdToPowerSupplyBuilds < ActiveRecord::Migration
  def change
    add_column :power_supply_builds, :market_status_id, :integer
  end
end
