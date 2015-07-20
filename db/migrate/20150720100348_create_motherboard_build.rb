class CreateMotherboardBuild < ActiveRecord::Migration
  def change
    create_table :motherboard_builds do |t|
      t.integer :motherboard_id
      t.integer :build_id
    end
  end
end
