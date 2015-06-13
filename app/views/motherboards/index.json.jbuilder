json.array!(@motherboards) do |motherboard|
  json.extract! motherboard, :id, :manufacturer, :part_no, :form_factor, :chipset, :memory_slots, :memory_type, :max_memory, :raid_support, :onboard_video, :crossfire_support, :sli_support, :sata_6_gbs, :onboard_ethernet, :onboard_usb_3_headers
  json.url motherboard_url(motherboard, format: :json)
end
