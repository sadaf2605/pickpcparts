json.array!(@memory_slots) do |memory_slot|
  json.extract! memory_slot, :id, :name
  json.url memory_slot_url(memory_slot, format: :json)
end
