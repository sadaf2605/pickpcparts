class RemoveManufacturerAndPartNoFromCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :manufacturer, :string
    remove_column :cpu_cases, :part_no, :string
  end
end
