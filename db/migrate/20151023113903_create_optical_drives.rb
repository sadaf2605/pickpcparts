class CreateOpticalDrives < ActiveRecord::Migration
  def change
    create_table :optical_drives do |t|
      t.references :product
      t.string :form_factor
      t.string :interface
      t.string :cache
      t.string :cd_dash_rom_speed
      t.string :cd_dash_r_speed
      t.string :cd_dash_rw_speed
      t.string :dvd_dash_rom_speed
      t.string :dvd_plus_r_speed
      t.string :dvd_plus_r_dual_layer_Speed
      t.string :dvd_plus_rw_speed
      t.string :dvd_dash_r_speed
      t.string :dvd_dash_r_dual_layer_speed
      t.string :dvd_dash_rw_speed
      t.string :dvd_ram_speed

      t.timestamps null: false
    end
  end
end
