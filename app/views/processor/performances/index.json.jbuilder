json.array!(@processor_performances) do |processor_performance|
  json.extract! processor_performance, :id, :no_of_cores, :no_of_threads, :processor_base_frequency_in_GHz, :thermal_design_power_in_W
  json.url processor_performance_url(processor_performance, format: :json)
end
