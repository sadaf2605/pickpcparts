class RemoveMemorySlotFromMotherboards < ActiveRecord::Migration
  def change
    remove_column :motherboards, :memory_slot, :string
  end
end
