class RemoveManufacturerAndPartNoFromMemories < ActiveRecord::Migration
  def change
    remove_column :memories, :manufacturer, :string
    remove_column :memories, :part_no, :string
  end
end
