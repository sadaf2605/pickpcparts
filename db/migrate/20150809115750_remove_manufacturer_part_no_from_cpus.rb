class RemoveManufacturerPartNoFromCpus < ActiveRecord::Migration
  def change
    remove_column :cpus, :manufacturer, :string
    remove_column :cpus, :part_no, :string
  end
end
