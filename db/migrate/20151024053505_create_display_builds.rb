class CreateDisplayBuilds < ActiveRecord::Migration
  def change
    create_table :display_builds do |t|
      t.integer :display_id
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
