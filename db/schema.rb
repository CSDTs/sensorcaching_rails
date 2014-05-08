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

ActiveRecord::Schema.define(version: 20140508140526) do

  create_table "sensor_data", force: true do |t|
    t.integer  "sensor_find_id"
    t.datetime "timestamp",      null: false
    t.float    "data",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sensor_data", ["sensor_find_id"], name: "index_sensor_data_on_sensor_find_id"

  create_table "sensor_finds", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "sensor_id",  null: false
    t.datetime "time",       null: false
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sensor_finds", ["sensor_id"], name: "index_sensor_finds_on_sensor_id"
  add_index "sensor_finds", ["user_id"], name: "index_sensor_finds_on_user_id"

  create_table "sensor_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sensor_types", ["name"], name: "index_sensor_types_on_name", unique: true

  create_table "sensors", force: true do |t|
    t.string   "name",           null: false
    t.text     "description"
    t.float    "latitude",       null: false
    t.float    "longitude",      null: false
    t.integer  "user_id",        null: false
    t.integer  "sensor_type_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  add_index "sensors", ["latitude"], name: "index_sensors_on_latitude"
  add_index "sensors", ["longitude"], name: "index_sensors_on_longitude"
  add_index "sensors", ["sensor_type_id"], name: "index_sensors_on_sensor_type_id"
  add_index "sensors", ["user_id"], name: "index_sensors_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["latitude"], name: "index_users_on_latitude"
  add_index "users", ["longitude"], name: "index_users_on_longitude"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "views", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["email"], name: "index_views_on_email", unique: true
  add_index "views", ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true

end
