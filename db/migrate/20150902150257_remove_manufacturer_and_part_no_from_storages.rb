class RemoveManufacturerAndPartNoFromStorages < ActiveRecord::Migration
  def change
    remove_column :storages, :manufacturer, :string
    remove_column :storages, :part_no, :string
  end
end
