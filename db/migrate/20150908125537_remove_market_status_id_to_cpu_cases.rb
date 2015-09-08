class RemoveMarketStatusIdToCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :market_status_id, :integer
  end
end
