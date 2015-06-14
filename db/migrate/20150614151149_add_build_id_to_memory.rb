class AddBuildIdToMemory < ActiveRecord::Migration
  def change
    add_column :memories, :build_id, :integer
  end
end
