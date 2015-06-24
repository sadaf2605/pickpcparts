class AddTypeToCpuCases < ActiveRecord::Migration
  def change
    add_column :cpu_cases, :type, :string
  end
end
