class AddMarketStatusIdToCpuBuilds < ActiveRecord::Migration
  def change
    begin
    add_column :cpu_builds, :market_status_id, :integer
    rescue StandardError
      create_table :cpu_builds do |t|
        t.integer :cpu_id
        t.integer :build_id
  
        t.timestamps null: false
      end
    end
  end
end
