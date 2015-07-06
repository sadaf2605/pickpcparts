class RenameFieldTypeToPowerSupplyTypeOfPowerSupplies < ActiveRecord::Migration
  def change
    rename_column :power_supplies, :type, :power_supply_type
  end
end
