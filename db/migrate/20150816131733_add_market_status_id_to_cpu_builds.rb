class AddMarketStatusIdToCpuBuilds < ActiveRecord::Migration
  def change
    
    create_table :cpu_builds do |t|
      t.integer :cpu_id
      t.integer :build_id

      t.timestamps null: false
    end
    add_column :cpu_builds, :market_status_id, :integer
    
  end
end
