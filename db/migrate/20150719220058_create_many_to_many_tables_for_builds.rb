class CreateManyToManyTablesForBuilds < ActiveRecord::Migration
  def self.up
    
    create_table 'cpus_builds', :id => false do |t|
      t.column :cpu_id, :integer
      t.column :build_id, :integer
    end
    create_table 'motherboards_builds', :id => false do |t|
      t.column :motherboard_id, :integer
      t.column :build_id, :integer
    end
    create_table 'coolers_builds', :id => false do |t|
      t.column :cooler_id, :integer
      t.column :build_id, :integer
    end
    create_table 'memories_builds', :id => false do |t|
      t.column :memory_id, :integer
      t.column :build_id, :integer
    end
    create_table 'storages_builds', :id => false do |t|
      t.column :storage_id, :integer
      t.column :build_id, :integer
    end
    create_table 'cpu_cases_builds', :id => false do |t|
      t.column :cpu_case_id, :integer
      t.column :build_id, :integer
    end
    create_table 'video_cards_builds', :id => false do |t|
      t.column :video_card_id, :integer
      t.column :build_id, :integer
    end
    create_table 'power_supplies_builds', :id => false do |t|
      t.column :power_supply_id, :integer
      t.column :build_id, :integer
    end
    
  end
end
