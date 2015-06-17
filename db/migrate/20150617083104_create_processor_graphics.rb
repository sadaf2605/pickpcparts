class CreateProcessorGraphics < ActiveRecord::Migration
  def change
    create_table :processor_graphics do |t|
      t.string :processor_graphics
      t.float :graphics_base_frequency_in_MHz
      t.float :graphics_max_dynamic_frequency_GHz
      t.float :graphics_video_max_memory_in_GB
      t.boolean :quick_sync_video
      t.boolean :wireless_display
      t.boolean :clear_video_hd_technology

      t.timestamps null: false
    end
  end
end
