class AddMarketStatusIdToCoolerBuilds < ActiveRecord::Migration
  def change
    add_column :cooler_builds, :market_status_id, :integer
  end
end
