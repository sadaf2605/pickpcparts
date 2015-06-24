class RemoveHeatFromMemory < ActiveRecord::Migration
  def change
    remove_column :memories, :heat, :string
    rename_column :memories, :spreader, :heat_spreader
  end
end
