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

ActiveRecord::Schema.define(version: 20180213210513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.date "date_of_birth", null: false
    t.integer "membership_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nationality"
    t.string "address"
    t.string "zip"
    t.string "city"
    t.string "phone"
    t.string "mom_phone"
    t.string "dad_phone"
    t.string "mom_email"
    t.string "dad_email"
    t.string "email", null: false
    t.integer "cpr"
    t.date "admission_date", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.integer "status", null: false
    t.index ["member_id"], name: "index_payments_on_member_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
