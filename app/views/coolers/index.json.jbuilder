json.array!(@coolers) do |cooler|
  json.extract! cooler, :id, :manufacturer, :part_no, :liquid_cooled, :radiator_size, :noise_level, :fan_rpm
  json.url cooler_url(cooler, format: :json)
end
