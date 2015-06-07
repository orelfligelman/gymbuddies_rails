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

ActiveRecord::Schema.define(version: 20150427170550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"
  enable_extension "hstore"

  create_table "addresses", force: true do |t|
    t.string   "city"
    t.string   "street_name"
    t.text     "street_address"
    t.text     "secondary_address"
    t.integer  "building_number"
    t.integer  "zip_code"
    t.string   "time_zone"
    t.string   "street_suffix"
    t.string   "city_suffix"
    t.string   "city_prefix"
    t.string   "state_abbr"
    t.string   "state"
    t.string   "country"
    t.text     "latitude"
    t.text     "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "butts", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.boolean  "fart"
    t.string   "shape"
    t.float    "percentbodysize"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chats", force: true do |t|
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", force: true do |t|
    t.string   "name"
    t.string   "avatar"
    t.boolean  "like"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "email"
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "gyms", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "gyms", ["user_id"], name: "index_gyms_on_user_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.hstore   "properties"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
