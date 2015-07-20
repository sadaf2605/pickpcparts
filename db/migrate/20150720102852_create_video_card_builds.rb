class CreateVideoCardBuilds < ActiveRecord::Migration
  def change
    create_table :video_card_builds do |t|
      t.integer :video_card_id
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
