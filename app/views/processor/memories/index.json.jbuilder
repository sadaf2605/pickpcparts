json.array!(@processor_memories) do |processor_memory|
  json.extract! processor_memory, :id, :max_memory_size_GB, :max_no_of_memory_channels, :max_memory_bandwidth_in_GBs, :ecc_memory_supported
  json.url processor_memory_url(processor_memory, format: :json)
end
