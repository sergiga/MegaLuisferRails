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

ActiveRecord::Schema.define(version: 20160815152600) do

  create_table "bills", force: :cascade do |t|
    t.integer  "client_id"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_bills_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "cif_dni",       null: false
    t.string   "name",          null: false
    t.string   "address"
    t.string   "contact_phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "phone_brands", force: :cascade do |t|
    t.string   "brand",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "phone_brand_id"
    t.string   "model"
    t.string   "model_review"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["phone_brand_id"], name: "index_phones_on_phone_brand_id"
  end

  create_table "repairs", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "status",      default: 0
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["bill_id"], name: "index_repairs_on_bill_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.integer  "telephone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
