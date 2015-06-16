class AddDimentionFactorsToCpuCases < ActiveRecord::Migration
  def change
    add_column :cpu_cases, :length, :decimal
    add_column :cpu_cases, :width, :decimal
    add_column :cpu_cases, :height, :decimal
  end
end
