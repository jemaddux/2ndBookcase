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

ActiveRecord::Schema.define(version: 20140722021325) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_comments", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "customer_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_ratings", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "customer_id"
    t.integer  "rating"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "body"
    t.integer  "customer_id"
    t.float    "rating"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.float    "rating"
    t.integer  "times_rated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author",      limit: 255
    t.text     "picture_url"
    t.string   "mobi_url"
    t.string   "pdf_url"
    t.string   "epub_url"
    t.string   "txt_url"
  end

  create_table "books_categories", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "book_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapters", force: :cascade do |t|
    t.integer  "book_id"
    t.string   "title",      limit: 255
    t.text     "summary"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "street_address",  limit: 255
    t.string   "city",            limit: 255
    t.string   "state",           limit: 255
    t.string   "zipcode",         limit: 255
    t.string   "account_status",  limit: 255
    t.string   "rental_plan",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
    t.integer  "plan_id"
  end

  create_table "customers_books_owneds", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers_books_reads", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "book_id"
    t.string   "condition",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked_out",                default: false
    t.boolean  "in_circulation",             default: true
  end

  create_table "plans", force: :cascade do |t|
    t.string   "description", limit: 255
    t.decimal  "cost",                    precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reading_lists", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "inventory_id"
    t.integer  "book_id"
    t.string   "loan_out_condition", limit: 255
    t.string   "returned_condition", limit: 255
    t.datetime "loan_out_date"
    t.datetime "returned_date"
    t.boolean  "out_on_loan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "in_list",                        default: true
  end

  create_table "series", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "customer_id"
    t.string   "stripe_card_token",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token", limit: 255
  end

end
