class CreateDropTableCpuCaseFormFactorMemberships < ActiveRecord::Migration
  def change
    create_table :drop_table_cpu_case_form_factor_memberships do |t|

      t.timestamps null: false
    end
  end
end
