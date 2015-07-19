class IdsForAllParts < ActiveRecord::Migration
  def self.up
    add_column :cpus, :build_id, :integer
    add_column :coolers, :build_id, :integer
    add_column :motherboards, :build_id, :integer
    #add_column :memories, :build_id, :integer
    add_column :storages, :build_id, :integer
    add_column :cpu_cases, :build_id, :integer
    add_column :video_cards, :build_id, :integer
    add_column :power_supplies, :build_id, :integer
  end
  def self.down
    remove_column :cpus, :build_id
    remove_column :coolers, :build_id
    remove_column :motherboards, :build_id
    #remove_column :memories, :build_id
    remove_column :storages, :build_id
    remove_column :cpu_cases, :build_id
    remove_column :video_cards, :build_id
    remove_column :power_supplies, :build_id
  end
end
