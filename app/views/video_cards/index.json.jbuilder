json.array!(@video_cards) do |video_card|
  json.extract! video_card, :id, :manufacturer, :part_no, :interface, :chipset, :memory_size, :memory_type, :core_clock, :tdp, :fan, :sli_support, :crossfire_support, :length, :dvi_d_dual_link, :display_port, :hdmi
  json.url video_card_url(video_card, format: :json)
end
