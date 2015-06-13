class CreateMotherboards < ActiveRecord::Migration
  def change
    create_table :motherboards do |t|
      t.string :manufacturer
      t.string :part_no
      t.string :form_factor
      t.string :chipset
      t.string :memory_slots
      t.string :memory_type
      t.string :max_memory
      t.boolean :raid_support
      t.string :onboard_video
      t.boolean :crossfire_support
      t.boolean :sli_support
      t.integer :sata_6_gbs
      t.string :onboard_ethernet
      t.boolean :onboard_usb_3_headers

      t.timestamps null: false
    end
  end
end
