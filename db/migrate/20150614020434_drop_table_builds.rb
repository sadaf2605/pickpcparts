class DropTableBuilds < ActiveRecord::Migration
  def change
  	drop_table :table_builds do |t|
      t.integer :cpu_id
      t.integer :motherboard_id
      t.integer :cooler_id
    end
  end
end
