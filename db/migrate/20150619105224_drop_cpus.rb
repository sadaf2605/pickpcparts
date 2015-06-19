class DropCpus < ActiveRecord::Migration
  def change
    drop_table :cpus
  end
end
