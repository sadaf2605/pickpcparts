class RemoveMarketStatusIdToCpuCaseBuilds < ActiveRecord::Migration
  def change
    remove_column :cpu_case_builds, :market_status_id, :integer
  end
end
