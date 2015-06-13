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

ActiveRecord::Schema.define(version: 20150613141629) do

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

  create_table "cpu_sockets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "motherboards", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.string   "form_factor"
    t.string   "chipset"
    t.string   "memory_slots"
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
  end

end
