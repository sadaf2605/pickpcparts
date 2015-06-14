class AddMemorySlotNumToMotherboard < ActiveRecord::Migration
  def change
    add_column :motherboards, :memory_slot_num, :integer
  end
end
