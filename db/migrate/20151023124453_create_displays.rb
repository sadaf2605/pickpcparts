class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.references :product, index: true
      t.string :screen_size
      t.string :recommended_resolution
      t.boolean :widescreen
      t.string :aspect_ratio
      t.string :viewing_angle
      t.string :display_colors
      t.string :brightness
      t.string :contrast_ratio
      t.string :response_time
      t.string :refresh_rate
      t.boolean :ips
      t.boolean :led
      t.boolean :built_in_speakers
      t.integer :dvi_d_dual_link
      t.integer :displayport
      t.integer :hdmi

      t.timestamps null: false
    end
    add_foreign_key :displays, :products
  end
end
