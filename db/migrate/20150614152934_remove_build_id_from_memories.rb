class RemoveBuildIdFromMemories < ActiveRecord::Migration
  def changeg
    remove_column :memories, :build_id, :integer
  end
end
