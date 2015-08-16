class CreateTableCpuBuilds < ActiveRecord::Migration
  def change
    create_table :cpu_builds do |t|
      t.integer :cpu_id
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
