class AddMarketStatusIdToCpuCaseBuilds < ActiveRecord::Migration
  def change
    add_column :cpu_case_builds, :market_status_id, :integer
  end
end
