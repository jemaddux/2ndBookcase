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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_comments", force: true do |t|
    t.integer  "article_id"
    t.integer  "customer_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_ratings", force: true do |t|
    t.integer  "article_id"
    t.integer  "customer_id"
    t.integer  "rating"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "customer_id"
    t.float    "rating"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "rating"
    t.integer  "times_rated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.text     "picture_url"
    t.string   "mobi_url"
    t.string   "pdf_url"
    t.string   "epub_url"
    t.string   "txt_url"
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

  create_table "chapters", force: true do |t|
    t.integer  "book_id"
    t.string   "title"
    t.text     "summary"
    t.integer  "position"
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
    t.string   "password_digest"
    t.integer  "plan_id"
  end

  create_table "customers_books_owneds", force: true do |t|
    t.integer  "customer_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers_books_reads", force: true do |t|
    t.integer  "customer_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.integer  "book_id"
    t.string   "condition"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked_out",    default: false
    t.boolean  "in_circulation", default: true
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

  create_table "series", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
