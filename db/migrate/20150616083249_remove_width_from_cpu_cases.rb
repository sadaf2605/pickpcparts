class RemoveWidthFromCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :length, :decimal
    remove_column :cpu_cases, :width, :decimal
    remove_column :cpu_cases, :height, :decimal


    add_column :cpu_cases, :length, :float
    add_column :cpu_cases, :width, :float
    add_column :cpu_cases, :height, :float
  end
end
