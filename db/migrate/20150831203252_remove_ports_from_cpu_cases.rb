class RemovePortsFromCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :ports, :boolean
  end
end
