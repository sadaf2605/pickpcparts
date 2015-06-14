class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :manufacturer
      t.string :part_no
      t.string :speed
      t.string :size
      t.string :price_gb
      t.string :cas
      t.string :voltage
      t.string :heat
      t.boolean :spreader
      t.boolean :ecc
      t.boolean :registered
      t.string :color

      t.timestamps null: false
    end
  end
end
