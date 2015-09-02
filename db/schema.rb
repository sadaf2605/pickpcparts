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

ActiveRecord::Schema.define(version: 20150902153656) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "blog_posts", force: :cascade do |t|
    t.string   "avatar"
    t.integer  "build_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "blogit_post_id"
    t.boolean  "is_featured"
    t.integer  "priority"
  end

  create_table "blogit_comments", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "website"
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogit_comments", ["post_id"], name: "index_blogit_comments_on_post_id"

  create_table "blogit_posts", force: :cascade do |t|
    t.string   "title",                            null: false
    t.text     "body",                             null: false
    t.string   "state",          default: "draft", null: false
    t.integer  "comments_count", default: 0,       null: false
    t.integer  "blogger_id"
    t.string   "blogger_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "blogit_posts", ["blogger_type", "blogger_id"], name: "index_blogit_posts_on_blogger_type_and_blogger_id"

  create_table "build_cpus", force: :cascade do |t|
    t.integer  "integer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "builds", force: :cascade do |t|
    t.string "token"
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

  create_table "cooler_builds", force: :cascade do |t|
    t.integer  "cooler_id"
    t.integer  "build_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "market_status_id"
  end

  create_table "coolers", force: :cascade do |t|
    t.boolean  "liquid_cooled"
    t.string   "radiator_size"
    t.string   "noise_level"
    t.string   "fan_rpm"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "product_id"
  end

  create_table "coolers_cpu_sockets", id: false, force: :cascade do |t|
    t.integer "cpu_socket_id"
    t.integer "cooler_id"
  end

  create_table "cpu_builds", force: :cascade do |t|
    t.integer  "cpu_id"
    t.integer  "build_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "market_status_id"
  end

  create_table "cpu_case_builds", force: :cascade do |t|
    t.integer  "cpu_case_id"
    t.integer  "build_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cpu_cases", force: :cascade do |t|
    t.string   "color"
    t.boolean  "includes_power_supply"
    t.integer  "external_5_25_bays"
    t.integer  "internal_2_5_bays"
    t.integer  "internal_3_5_bays"
    t.string   "maximum_video_card_length"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "case_type"
    t.float    "length"
    t.float    "width"
    t.float    "height"
    t.integer  "form_factor_id"
    t.integer  "product_id"
    t.boolean  "front_panel_usb_3_0_ports"
  end

  create_table "cpu_sockets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cpu_sockets", ["name"], name: "index_cpu_sockets_on_name", unique: true

  create_table "cpus", force: :cascade do |t|
    t.string   "model"
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
    t.integer  "product_id"
  end

  create_table "form_factors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "market_statuses", force: :cascade do |t|
    t.integer "shop_id"
    t.float   "price"
    t.integer "product_id"
  end

  create_table "memories", force: :cascade do |t|
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
    t.integer  "memory_slot_id"
    t.integer  "product_id"
  end

  create_table "memory_builds", force: :cascade do |t|
    t.integer  "memory_id"
    t.integer  "build_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "market_status_id"
  end

  create_table "memory_slots", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motherboard_builds", force: :cascade do |t|
    t.integer "motherboard_id"
    t.integer "build_id"
    t.integer "market_status_id"
  end

  create_table "motherboards", force: :cascade do |t|
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
    t.integer  "cpu_socket_id"
    t.integer  "memory_slot_num"
    t.integer  "memory_slot_id"
    t.integer  "form_factor_id"
    t.integer  "product_id"
  end

  create_table "power_supplies", force: :cascade do |t|
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
    t.integer  "product_id"
  end

  create_table "power_supply_builds", force: :cascade do |t|
    t.integer  "power_supply_id"
    t.integer  "build_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "market_status_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "part_no"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "avatar"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "contact"
    t.string "avatar"
  end

  create_table "storage_builds", force: :cascade do |t|
    t.integer  "storage_id"
    t.integer  "build_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "market_status_id"
  end

  create_table "storages", force: :cascade do |t|
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
    t.integer  "product_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "video_card_builds", force: :cascade do |t|
    t.integer  "video_card_id"
    t.integer  "build_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "market_status_id"
  end

  create_table "video_cards", force: :cascade do |t|
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
    t.integer  "product_id"
  end

end
