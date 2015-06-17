json.array!(@processor_advanced_technologies) do |processor_advanced_technology|
  json.extract! processor_advanced_technology, :id, :turbo_boost_technology, :vPro_technology, :hyper_threading_technology, :virtualization_technology_vtx, :virtualization_technology_for_directed_IO_vtd, :vtx_with_extended_page_tables_ept, :TSX_NI, :intel_64, :idle_states, :enhanced_speedstep_technology, :thermal_monitoring_technologies, :virtualization_technology_for_itanium_vti, :stable_image_platform_program_SIPP
  json.url processor_advanced_technology_url(processor_advanced_technology, format: :json)
end
