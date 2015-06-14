class CreateMemorySlots < ActiveRecord::Migration
  def change
    create_table :memory_slots do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
