# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150706163455) do

  create_table "builds", force: :cascade do |t|
    t.integer "cpu_id"
    t.integer "motherboard_id"
    t.integer "cooler_id"
    t.integer "memory_id"
    t.integer "storage_id"
    t.integer "video_card_id"
    t.integer "cpu_case_id"
    t.string  "token"
    t.integer "power_supply_id"
  end

  create_table "cases", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "type"
    t.string   "color"
    t.boolean  "includes_power_supply"
    t.integer  "external_5_25_bays"
    t.integer  "internal_2_5_bays"
    t.integer  "internal_3_5_bays"
    t.string   "motherboard_compatibility"
    t.string   "front_panel_usb_3_0"
    t.boolean  "ports"
    t.string   "maximum_video_card_length"
    t.string   "dimensions"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "coolers", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.boolean  "liquid_cooled"
    t.string   "radiator_size"
    t.string   "noise_level"
    t.string   "fan_rpm"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "coolers_cpu_sockets", id: false, force: :cascade do |t|
    t.integer "cpu_socket_id"
    t.integer "cooler_id"
  end

  create_table "cpu_cases", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "color"
    t.boolean  "includes_power_supply"
    t.integer  "external_5_25_bays"
    t.integer  "internal_2_5_bays"
    t.integer  "internal_3_5_bays"
    t.string   "motherboard_compatibility"
    t.string   "front_panel_usb_3_0"
    t.boolean  "ports"
    t.string   "maximum_video_card_length"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "case_type"
    t.float    "length"
    t.float    "width"
    t.float    "height"
    t.integer  "form_factor_id"
    t.string   "type"
  end

  create_table "cpu_sockets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cpu_sockets", ["name"], name: "index_cpu_sockets_on_name", unique: true

  create_table "cpus", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "model"
    t.string   "part_no"
    t.string   "data_width"
    t.string   "speed"
    t.integer  "cores"
    t.string   "l1_cache"
    t.string   "l2_cache"
    t.string   "l3_cache"
    t.string   "lithography"
    t.string   "thermal_design_power"
    t.boolean  "includes_cpu_cooler"
    t.boolean  "hyper_threading"
    t.string   "integrated_graphics"
    t.integer  "cpu_socket_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "form_factors", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.integer  "cpu_case_id"
  end

  create_table "memories", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "speed"
    t.string   "size"
    t.string   "price_gb"
    t.string   "cas"
    t.string   "voltage"
    t.boolean  "heat_spreader"
    t.boolean  "ecc"
    t.boolean  "registered"
    t.string   "color"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "memory"
    t.integer  "memory_slot_id"
    t.integer  "build_id"
  end

  create_table "memory_slots", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motherboards", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "chipset"
    t.string   "memory_type"
    t.string   "max_memory"
    t.boolean  "raid_support"
    t.string   "onboard_video"
    t.boolean  "crossfire_support"
    t.boolean  "sli_support"
    t.integer  "sata_6_gbs"
    t.string   "onboard_ethernet"
    t.boolean  "onboard_usb_3_headers"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "motherboard"
    t.integer  "cpu_socket_id"
    t.integer  "memory_slot_num"
    t.integer  "memory_slot_id"
    t.integer  "form_factor_id"
  end

  create_table "power_supplies", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "power_supply_type"
    t.string   "wattage"
    t.integer  "fans"
    t.boolean  "modular"
    t.string   "efficiency_certification"
    t.string   "efficiency"
    t.string   "output"
    t.string   "pci_express_6_plus_2_pin_connectors"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "processor_advanced_technologies", force: :cascade do |t|
    t.boolean  "turbo_boost_technology"
    t.boolean  "vPro_technology"
    t.boolean  "hyper_threading_technology"
    t.boolean  "virtualization_technology_vtx"
    t.boolean  "virtualization_technology_for_directed_IO_vtd"
    t.boolean  "vtx_with_extended_page_tables_ept"
    t.boolean  "TSX_NI"
    t.boolean  "intel_64"
    t.boolean  "idle_states"
    t.boolean  "enhanced_speedstep_technology"
    t.boolean  "thermal_monitoring_technologies"
    t.boolean  "virtualization_technology_for_itanium_vti"
    t.boolean  "stable_image_platform_program_SIPP"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "processor_data_protections", force: :cascade do |t|
    t.boolean  "AES_new_nstructions"
    t.boolean  "secure_key"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "processor_expansions", force: :cascade do |t|
    t.float    "PCI_express_revision"
    t.integer  "max_no_of_PCI_express_lanes"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "processor_graphics", force: :cascade do |t|
    t.string   "processor_graphics"
    t.float    "graphics_base_frequency_in_MHz"
    t.float    "graphics_max_dynamic_frequency_GHz"
    t.float    "graphics_video_max_memory_in_GB"
    t.boolean  "quick_sync_video"
    t.boolean  "wireless_display"
    t.boolean  "clear_video_hd_technology"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "no_of_displays_supported"
  end

  create_table "processor_memories", force: :cascade do |t|
    t.integer  "max_memory_size_GB"
    t.integer  "max_no_of_memory_channels"
    t.float    "max_memory_bandwidth_in_GBs"
    t.boolean  "ecc_memory_supported"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "processor_packages", force: :cascade do |t|
    t.integer  "max_cpu_configuration"
    t.integer  "TCASE_in_C"
    t.float    "package_width_in_mn"
    t.float    "package_length_in_mn"
    t.integer  "graphics_and_imc_lithography_in_nm"
    t.string   "low_halogen_options_available"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "cpu_socket_id"
  end

  create_table "processor_performances", force: :cascade do |t|
    t.integer  "no_of_cores"
    t.integer  "no_of_threads"
    t.float    "processor_base_frequency_in_GHz"
    t.float    "thermal_design_power_in_W"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "processor_platform_protections", force: :cascade do |t|
    t.boolean  "trusted_execution_technology"
    t.boolean  "execute_disable_bit"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "processor_processor_advanced_options", force: :cascade do |t|
    t.boolean  "turbo_boost_technology"
    t.boolean  "vPro_technology"
    t.boolean  "hyper_threading_technology"
    t.boolean  "virtualization_technology_vtx"
    t.boolean  "virtualization_technology_for_directed_IO_vtd"
    t.boolean  "vtx_with_extended_page_tables_ept"
    t.boolean  "TSX_NI"
    t.boolean  "intel_64"
    t.boolean  "idle_states"
    t.boolean  "enhanced_speedstep_technology"
    t.boolean  "thermal_monitoring_technologies"
    t.boolean  "virtualization_technology_for_itanium_vti"
    t.boolean  "stable_image_platform_program_SIPP"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "processor_processors", force: :cascade do |t|
    t.string   "processor_number"
    t.float    "cache_in_MB"
    t.float    "DMI2_in_GTs"
    t.integer  "instruction_set_in_bit"
    t.string   "instruction_set_extensions"
    t.boolean  "embedded_options_available"
    t.float    "lithography_in_nm"
    t.string   "scalability"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "processor_performance_id"
    t.integer  "processor_memory_id"
    t.integer  "processor_graphic_id"
    t.integer  "processor_advanced_technology_id"
    t.integer  "processor_data_protection_id"
    t.integer  "processor_expansion_id"
    t.integer  "processor_package_id"
    t.integer  "processor_platform_protection_id"
  end

  create_table "processors", force: :cascade do |t|
    t.integer "processor_performance_id"
    t.integer "processor_memory_id"
    t.integer "processor_graphic_id"
    t.integer "processor_advanced_technology_id"
    t.integer "processor_data_protection_id"
    t.integer "processor_expansion_id"
    t.integer "processor_package_id"
    t.integer "processor_platform_protection_id"
  end

  create_table "storages", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "capacity"
    t.string   "interface"
    t.string   "cache"
    t.string   "form_factor"
    t.string   "ssd_controller"
    t.string   "nand_flash_type"
    t.string   "gb_1"
    t.string   "price_gb"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "video_cards", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "interface"
    t.string   "chipset"
    t.string   "memory_size"
    t.string   "memory_type"
    t.string   "core_clock"
    t.string   "tdp"
    t.boolean  "fan"
    t.boolean  "sli_support"
    t.integer  "dvi_d_dual_link"
    t.integer  "display_port"
    t.integer  "hdmi"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "length"
    t.boolean  "crossfire_support"
  end

end
