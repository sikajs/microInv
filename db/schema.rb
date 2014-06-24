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

ActiveRecord::Schema.define(version: 20140624073052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adjust_history", id: false, force: true do |t|
    t.integer  "uid",                        null: false
    t.integer  "item_id",        limit: 8,   null: false
    t.integer  "previous_stock",             null: false
    t.integer  "new_stock",                  null: false
    t.string   "reason",         limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "com_info", id: false, force: true do |t|
    t.string  "com_name",       limit: 150,               null: false
    t.string  "com_businessno",                           null: false
    t.string  "com_address"
    t.string  "com_tel"
    t.string  "com_fax"
    t.string  "com_zipcode"
    t.decimal "com_vat",                    default: 1.0
  end

  create_table "cro_items", id: false, force: true do |t|
    t.integer "cro_id",   limit: 8,  null: false
    t.integer "item_id",  limit: 8,  null: false
    t.integer "qty"
    t.string  "sameitem", limit: 40
    t.decimal "price",               null: false
    t.string  "barcode"
  end

  create_table "cros", force: true do |t|
    t.integer  "customer_id",   null: false
    t.datetime "updated_at",    null: false
    t.decimal  "return_total",  null: false
    t.decimal  "orig_discount"
  end

  create_table "customers", primary_key: "customer_id", force: true do |t|
    t.string "cust_name",    limit: 500, null: false
    t.string "cust_tel",     limit: 12
    t.string "cust_fax",     limit: 12
    t.string "cust_mobile",  limit: 10
    t.string "cust_email",   limit: 100
    t.string "cust_address", limit: 200
  end

  create_table "item_use_packs", id: false, force: true do |t|
    t.integer "item_id", limit: 8, null: false
    t.integer "pack_id",           null: false
  end

  create_table "items", primary_key: "item_id", force: true do |t|
    t.string   "item_name",         limit: 1000,                                 null: false
    t.string   "item_name_en",      limit: 1000
    t.integer  "stock"
    t.integer  "supplier_id",       limit: 8
    t.string   "brand",             limit: 30
    t.decimal  "unit_cost"
    t.decimal  "unit_price"
    t.string   "product_code",      limit: 30
    t.string   "barcode",           limit: 20
    t.string   "color",             limit: 20
    t.datetime "updated_at",                     default: '2014-06-19 04:45:41', null: false
    t.datetime "last_restock_date",              default: '2014-06-19 04:45:41'
    t.boolean  "active",                         default: true,                  null: false
    t.datetime "created_at",                     default: '2014-06-19 04:45:41', null: false
    t.decimal  "initial_stock",                  default: 0.0
    t.string   "category",          limit: 50
  end

  add_index "items", ["barcode"], name: "barcode_uniq", unique: true, using: :btree

  create_table "mth_report", id: false, force: true do |t|
    t.integer "year",         null: false
    t.integer "month",        null: false
    t.integer "num_of_order", null: false
    t.decimal "revenue"
    t.decimal "gp"
    t.decimal "avg_revenue"
    t.decimal "total_cro"
  end

  create_table "order_items", id: false, force: true do |t|
    t.integer "order_id",                           null: false
    t.integer "item_id",                            null: false
    t.integer "qty"
    t.string  "sameitem",  limit: 40
    t.decimal "price",                default: 0.0, null: false
    t.string  "barcode"
    t.decimal "curr_cost"
    t.decimal "margin"
  end

  create_table "orders", primary_key: "order_id", force: true do |t|
    t.integer  "customer_id",   limit: 8
    t.datetime "updated_at"
    t.boolean  "cancelled",                 default: false, null: false
    t.datetime "cancel_time"
    t.decimal  "discount",                  default: 0.0
    t.boolean  "isvatted",                  default: false, null: false
    t.decimal  "cash_received"
    t.decimal  "change"
    t.string   "comment",       limit: 300
    t.decimal  "order_cost",                default: 0.0
  end

  create_table "packs", primary_key: "pack_id", force: true do |t|
    t.string  "pack_name",     limit: 200,               null: false
    t.string  "pack_category", limit: 50
    t.decimal "pack_unitcost",             default: 0.0
    t.integer "est_stock",                 default: 0,   null: false
    t.string  "pack_name_en",  limit: 200
  end

  create_table "restock_history", id: false, force: true do |t|
    t.integer  "uid",                                                      null: false
    t.datetime "restock_time",             default: '2014-06-19 04:45:41', null: false
    t.integer  "item_id",        limit: 8,                                 null: false
    t.integer  "previous_stock",                                           null: false
    t.integer  "new_arrival",                                              null: false
    t.decimal  "previous_cost",                                            null: false
    t.decimal  "new_cost"
    t.integer  "supplier_id",    limit: 8,                                 null: false
  end

  create_table "sme_access", primary_key: "uid", force: true do |t|
    t.string   "username",       limit: 50,                                  null: false
    t.string   "password",       limit: 200,                                 null: false
    t.string   "description",    limit: 500
    t.boolean  "main_order",                 default: false,                 null: false
    t.boolean  "main_inventory",             default: false,                 null: false
    t.boolean  "firstlogin",                 default: true,                  null: false
    t.datetime "lastupdate",                 default: '2014-06-19 04:45:41', null: false
    t.boolean  "main_user",                  default: false,                 null: false
  end

  add_index "sme_access", ["username"], name: "sme_access_username_key", unique: true, using: :btree

  create_table "suppliers", primary_key: "supplier_id", force: true do |t|
    t.string   "suppl_name",    limit: 500
    t.string   "business_num",  limit: 30
    t.string   "suppl_tel",     limit: 12
    t.string   "suppl_fax",     limit: 12
    t.string   "suppl_mobile",  limit: 10
    t.string   "suppl_email",   limit: 100
    t.string   "suppl_address", limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suppliers", ["business_num"], name: "businessno_unique", unique: true, using: :btree

end
