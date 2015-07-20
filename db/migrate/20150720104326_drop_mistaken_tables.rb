class DropMistakenTables < ActiveRecord::Migration
  def change
    drop_table :cpus_builds
    drop_table :coolers_builds
    drop_table :motherboards_builds
    drop_table :memories_builds
    drop_table :cpu_cases_builds
    drop_table :power_supplies_builds
    drop_table :storages_builds
    drop_table :video_cards_builds    
  end
end
