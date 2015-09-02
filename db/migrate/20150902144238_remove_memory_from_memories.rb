class RemoveMemoryFromMemories < ActiveRecord::Migration
  def change
    remove_column :memories, :memory, :string
  end
end
