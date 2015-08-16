class AddMarketStatusIdToMemoryBuilds < ActiveRecord::Migration
  def change
    add_column :memory_builds, :market_status_id, :integer
  end
end
