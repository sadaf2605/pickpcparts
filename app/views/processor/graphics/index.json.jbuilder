json.array!(@processor_graphics) do |processor_graphic|
  json.extract! processor_graphic, :id, :processor_graphics, :graphics_base_frequency_in_MHz, :graphics_max_dynamic_frequency_GHz, :graphics_video_max_memory_in_GB, :quick_sync_video, :wireless_display, :clear_video_hd_technology
  json.url processor_graphic_url(processor_graphic, format: :json)
end
