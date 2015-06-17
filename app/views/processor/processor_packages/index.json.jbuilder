json.array!(@processor_processor_packages) do |processor_processor_package|
  json.extract! processor_processor_package, :id, :max_cpu_configuration, :TCASE_in_C, :package_width_in_mn, :package_length_in_mn, :graphics_and_imc_lithography_in_nm, :low_halogen_options_available
  json.url processor_processor_package_url(processor_processor_package, format: :json)
end
