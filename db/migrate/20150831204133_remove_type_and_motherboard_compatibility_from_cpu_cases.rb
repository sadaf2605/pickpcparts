class RemoveTypeAndMotherboardCompatibilityFromCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :motherboard_compatibility, :string
    remove_column :cpu_cases, :type, :String
  end
end
