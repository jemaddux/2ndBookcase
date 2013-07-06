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

ActiveRecord::Schema.define(version: 20130706063308) do

  create_table "books", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "rating"
    t.integer  "times_rated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
  end

  create_table "books_categories", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "book_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "account_status"
    t.string   "rental_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "password_digest"
  end

  add_index "customers", ["remember_me_token"], name: "index_customers_on_remember_me_token"

  create_table "inventories", force: true do |t|
    t.integer  "book_id"
    t.string   "condition"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked_out", default: false
  end

  create_table "reading_lists", force: true do |t|
    t.integer  "customer_id"
    t.integer  "inventory_id"
    t.integer  "book_id"
    t.string   "loan_out_condition"
    t.string   "returned_condition"
    t.datetime "loan_out_date"
    t.datetime "returned_date"
    t.boolean  "out_on_loan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "in_list",            default: true
  end

end
