class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.integer :cpu_id
      t.integer :motherboard_id
      t.integer :cooler_id
    end
  end
end
