class CreateTableCpuCaseFormFactorMemberships < ActiveRecord::Migration
  def change
    create_table :table_cpu_case_form_factor_memberships do |t|
      t.integer :cpu_case_id
      t.integer :form_factor_id
    end
  end
end
