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

ActiveRecord::Schema.define(version: 20130713213310) do

  create_table "admins", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.integer  "plan_id"
  end

  create_table "inventories", force: true do |t|
    t.integer  "book_id"
    t.string   "condition"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked_out", default: false
  end

  create_table "plans", force: true do |t|
    t.string   "description"
    t.decimal  "cost",        precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "subscriptions", force: true do |t|
    t.integer  "plan_id"
    t.integer  "customer_id"
    t.string   "stripe_card_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token"
  end

end
