class RenameTypeToCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :type, :string
    add_column :cpu_cases, :case_type, :string
  end
end
