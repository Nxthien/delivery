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

ActiveRecord::Schema.define(version: 20161018075512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "sum_money"
    t.integer  "distant"
    t.integer  "sale"
    t.integer  "money"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.integer  "basicprice"
    t.integer  "amount"
    t.integer  "countorder"
    t.integer  "bouns"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "listtype_id"
    t.string   "image"
    t.string   "crawl_image"
    t.string   "description"
    t.index ["id"], name: "index_foods_on_id", using: :btree
    t.index ["listtype_id"], name: "index_foods_on_listtype_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "basic"
    t.integer  "amount"
    t.integer  "price"
    t.string   "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "cart_id"
    t.index ["cart_id"], name: "index_items_on_cart_id", using: :btree
  end

  create_table "listtypes", force: :cascade do |t|
    t.string   "name"
    t.string   "type_food",     default: [],              array: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "restaurant_id"
    t.integer  "cart_id"
    t.index ["cart_id"], name: "index_listtypes_on_cart_id", using: :btree
    t.index ["restaurant_id"], name: "index_listtypes_on_restaurant_id", using: :btree
    t.index ["type_food"], name: "index_listtypes_on_type_food", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "type_restaurant"
    t.string   "name"
    t.string   "address"
    t.string   "time_open"
    t.string   "time_close"
    t.string   "price_range"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
    t.string   "region"
    t.string   "type_food"
    t.string   "coverimage"
    t.index ["id"], name: "index_restaurants_on_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "phonenumber"
    t.string   "address"
    t.boolean  "isadmin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "carts", "users"
  add_foreign_key "foods", "listtypes"
  add_foreign_key "items", "carts"
  add_foreign_key "listtypes", "carts"
  add_foreign_key "listtypes", "restaurants"
end
