class AddMarketStatusIdToStorageBuilds < ActiveRecord::Migration
  def change
    add_column :storage_builds, :market_status_id, :integer
  end
end
