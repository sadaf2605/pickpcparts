class AddFormFactorIdToCpuCases < ActiveRecord::Migration
  def change
    add_column :cpu_cases, :form_factor_id, :integer
    remove_column :cpu_cases, :form_factor, :string
  end
end
