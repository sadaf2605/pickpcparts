class CreateCpuCases < ActiveRecord::Migration
  def change
    create_table :cpu_cases do |t|
      t.string :manufacturer
      t.string :part_no
      t.string :type
      t.string :color
      t.boolean :includes_power_supply
      t.integer :external_5_25_bays
      t.integer :internal_2_5_bays
      t.integer :internal_3_5_bays
      t.string :motherboard_compatibility
      t.string :front_panel_usb_3_0
      t.boolean :ports
      t.string :maximum_video_card_length
      t.string :dimensions

      t.timestamps null: false
    end
  end
end
