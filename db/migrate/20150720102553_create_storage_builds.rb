class CreateStorageBuilds < ActiveRecord::Migration
  def change
    create_table :storage_builds do |t|
      t.integer :storage_id
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
