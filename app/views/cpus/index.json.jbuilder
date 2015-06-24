json.array!(@cpus) do |cpu|
  json.extract! cpu, :id, :manufacturer, :model, :part_no, :data_width, :speed, :cores, :l1_cache, :l2_cache, :l3_cache, :lithography, :thermal_design_power, :includes_cpu_cooler, :hyper_threading, :integrated_graphics, :cpu_socket_id
  json.url cpu_url(cpu, format: :json)
end
