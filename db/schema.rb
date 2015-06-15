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

ActiveRecord::Schema.define(version: 20150615060335) do

  create_table "builds", force: :cascade do |t|
    t.integer "cpu_id"
    t.integer "motherboard_id"
    t.integer "cooler_id"
    t.integer "memory_id"
    t.integer "storage_id"
    t.integer "video_card_id"
    t.integer "cpu_case_id"
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
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "cpu"
    t.integer  "cpu_socket_id"
  end

  create_table "memories", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "speed"
    t.string   "size"
    t.string   "price_gb"
    t.string   "cas"
    t.string   "voltage"
    t.string   "heat"
    t.boolean  "spreader"
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
    t.string   "form_factor"
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
  end

  create_table "power_supplies", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "type"
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
    t.string   "crossfire_support"
    t.string   "length"
    t.integer  "dvi_d_dual_link"
    t.integer  "display_port"
    t.integer  "hdmi"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
