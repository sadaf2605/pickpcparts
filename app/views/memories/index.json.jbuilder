json.array!(@memories) do |memory|
  json.extract! memory, :id, :manufacturer, :part_no, :speed, :size, :price/gb, :cas, :voltage, :heat, :spreader, :ecc, :registered, :color
  json.url memory_url(memory, format: :json)
end
