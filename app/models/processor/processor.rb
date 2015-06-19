class Processor::Processor < ActiveRecord::Base

  belongs_to :processor_performance, :class_name => 'Processor::Performance'
  belongs_to :processor_memory, :class_name => 'Processor::Memory'
  belongs_to :processor_graphic, :class_name => 'Processor::Graphic'
  belongs_to :processor_advanced_technology, :class_name => 'Processor::AdvancedTechnology'
  belongs_to :processor_data_protection, :class_name => 'Processor::DataProtection'
  belongs_to :processor_expansion, :class_name => 'Processor::Expansion'
  belongs_to :processor_package, :class_name => 'Processor::Package'
  belongs_to :processor_platform_protection, :class_name => 'Processor::PlatformProtection'


  attr_accessor :no_of_cores, :no_of_threads, :processor_base_frequency_in_GHz, :thermal_design_power_in_W
  attr_accessor :max_memory_size_GB, :max_no_of_memory_channels, :max_memory_bandwidth_in_GBs, :ecc_memory_supported

  attr_accessor :processor_graphics, :graphics_base_frequency_in_MHz, :graphics_max_dynamic_frequency_GHz, :graphics_video_max_memory_in_GB, :quick_sync_video, :wireless_display, :clear_video_hd_technology, :no_of_displays_supported
  attr_accessor :PCI_express_revision, :max_no_of_PCI_express_lanes
  attr_accessor :max_cpu_configuration, :TCASE_in_C, :package_width_in_mn, :package_length_in_mn, :graphics_and_imc_lithography_in_nm, :low_halogen_options_available

  attr_accessor :turbo_boost_technology, :vPro_technology, :hyper_threading_technology, :virtualization_technology_vtx, :virtualization_technology_for_directed_IO_vtd, :vtx_with_extended_page_tables_ept, :TSX_NI, :intel_64, :idle_states, :enhanced_speedstep_technology, :thermal_monitoring_technologies, :virtualization_technology_for_itanium_vti, :stable_image_platform_program_SIPP
  attr_accessor :AES_new_nstructions,:secure_key
  attr_accessor :trusted_execution_technology, :execute_disable_bit
end