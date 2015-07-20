class AddCoolerBuild < ActiveRecord::Migration
  
  def self.up
    create_table :cooler_builds do |t|
      t.integer :cooler_id
      t.integer :build_id

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :cooler_builds
  end
  
end
