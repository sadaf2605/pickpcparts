class RemoveDimensionsFromCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :dimensions, :string
  end
end
