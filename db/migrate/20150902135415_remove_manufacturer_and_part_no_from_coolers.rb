class RemoveManufacturerAndPartNoFromCoolers < ActiveRecord::Migration
  def change
    remove_column :coolers, :manufacturer, :string
    remove_column :coolers, :part_no, :string
  end
end
