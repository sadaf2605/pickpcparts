class RemoveMemorySlotsFromMotherboard < ActiveRecord::Migration
  def change
    remove_column :motherboards, :memory_slots, :string
  end
end
