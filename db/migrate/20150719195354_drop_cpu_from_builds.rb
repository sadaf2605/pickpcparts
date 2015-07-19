class DropCpuFromBuilds < ActiveRecord::Migration
  def change
    remove_column :builds, :cpu_id
    remove_column :builds, :cooler_id
    remove_column :builds, :motherboard_id
    remove_column :builds, :memory_id
    remove_column :builds, :storage_id
    remove_column :builds, :cpu_case_id
    remove_column :builds, :video_card_id
    remove_column :builds, :power_supply
  end
end
