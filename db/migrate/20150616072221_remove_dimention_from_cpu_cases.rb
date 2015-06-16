class RemoveDimentionFromCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :dimentions, :string
  end
end
