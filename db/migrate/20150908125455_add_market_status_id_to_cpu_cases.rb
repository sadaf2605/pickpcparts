class AddMarketStatusIdToCpuCases < ActiveRecord::Migration
  def change
    add_column :cpu_cases, :market_status_id, :integer
  end
end
