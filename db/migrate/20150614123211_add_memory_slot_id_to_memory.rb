class AddMemorySlotIdToMemory < ActiveRecord::Migration
  def change
    add_column :memories, :memory, :string
    add_column :memories, :memory_slot_id, :integer
  end
end
