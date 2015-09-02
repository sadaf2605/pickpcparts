class RemoveManufacturerAndPartNoFromPowerSupplies < ActiveRecord::Migration
  def change
    remove_column :power_supplies, :manufacturer, :string
    remove_column :power_supplies, :part_no, :string
  end
end
