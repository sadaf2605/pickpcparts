class CreateMemoryBuilds < ActiveRecord::Migration
  def change
    create_table :memory_builds do |t|
      t.integer :memory_id
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
