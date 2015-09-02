class RemoveManufacturerAndPartNoFromMotherboards < ActiveRecord::Migration
  def change
    remove_column :motherboards, :manufacturer, :string
    remove_column :motherboards, :part_no, :string
  end
end
