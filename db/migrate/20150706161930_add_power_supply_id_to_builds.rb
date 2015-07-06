class AddPowerSupplyIdToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :power_supply_id, :integer
  end
end
