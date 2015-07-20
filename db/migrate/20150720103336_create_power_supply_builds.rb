class CreatePowerSupplyBuilds < ActiveRecord::Migration
  def change
    create_table :power_supply_builds do |t|
      t.integer :power_supply_id
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
