class AddCpuCaseIdToFormFactors < ActiveRecord::Migration
  def change
    add_column :form_factors, :cpu_case_id, :integer
  end
end
