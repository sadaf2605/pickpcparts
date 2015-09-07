class RemoveFormFactorIdFromCpuCases < ActiveRecord::Migration
  def change
    remove_column :cpu_cases, :form_factor_id, :integer
  end
end
