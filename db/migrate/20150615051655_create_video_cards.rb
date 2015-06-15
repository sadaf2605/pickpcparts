class CreateVideoCards < ActiveRecord::Migration
  def change
    create_table :video_cards do |t|
      t.string :manufacturer
      t.string :part_no
      t.string :interface
      t.string :chipset
      t.string :memory_size
      t.string :memory_type
      t.string :core_clock
      t.string :tdp
      t.boolean :fan
      t.boolean :sli_support
      t.string :crossfire_support
      t.string :length
      t.integer :dvi_d_dual_link
      t.integer :display_port
      t.integer :hdmi

      t.timestamps null: false
    end
  end
end
