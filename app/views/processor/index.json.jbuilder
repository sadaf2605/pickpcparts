json.array!(@processor_processors) do |processor_processor|
  json.extract! processor_processor, :id, :processor_number, :cache_in_MB, :DMI2_in_GTs, :instruction_set_in_bit, :instruction_set_extensions, :embedded_options_available, :lithography_in_nm, :scalability
  json.url processor_processor_url(processor_processor, format: :json)
end
