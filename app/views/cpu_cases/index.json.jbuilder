json.array!(@cpu_cases) do |cpu_case|
  json.extract! cpu_case, :id, :manufacturer, :part_no, :type, :color, :includes_power_supply, :external_5_25_bays, :internal_2_5_bays, :internal_3_5_bays, :motherboard_compatibility, :front_panel_usb_3_0, :ports, :maximum_video_card_length, :dimensions
  json.url cpu_case_url(cpu_case, format: :json)
end
