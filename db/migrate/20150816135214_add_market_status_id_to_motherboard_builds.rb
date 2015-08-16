class AddMarketStatusIdToMotherboardBuilds < ActiveRecord::Migration
  def change
    add_column :motherboard_builds, :market_status_id, :integer
  end
end
