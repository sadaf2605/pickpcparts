class AddCpuCaseIdToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :cpu_case_id, :integer
  end
end
