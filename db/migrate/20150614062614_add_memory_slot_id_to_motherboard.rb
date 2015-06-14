class AddMemorySlotIdToMotherboard < ActiveRecord::Migration
  def change
    add_column :motherboards, :memory_slot_id, :integer
  end
end
