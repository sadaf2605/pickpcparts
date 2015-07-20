class CreateCpuCaseBuilds < ActiveRecord::Migration
  def change
    create_table :cpu_case_builds do |t|
      t.integer :cpu_case_id
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
