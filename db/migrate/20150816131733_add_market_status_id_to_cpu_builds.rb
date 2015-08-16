class AddMarketStatusIdToCpuBuilds < ActiveRecord::Migration
  def change
    add_column :cpu_builds, :market_status_id, :integer
    
  end
end
