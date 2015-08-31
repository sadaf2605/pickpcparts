class RemoveCpuCaseIdFromFormFactors < ActiveRecord::Migration
  def change
    remove_column :form_factors, :cpu_case_id, :integer
  end
end
