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

ActiveRecord::Schema.define(version: 20161106153159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "author"
    t.integer  "rating"
    t.integer  "category_id"
  end

  add_index "books", ["category_id"], name: "index_books_on_category_id", unique: true, using: :btree
  add_index "books", ["title"], name: "index_books_on_title", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "category", null: false
  end

  add_index "categories", ["category"], name: "index_categories_on_category", unique: true, using: :btree

  create_table "categorizations", id: false, force: :cascade do |t|
    t.integer "book_id"
    t.integer "category_id"
  end

  add_index "categorizations", ["book_id"], name: "index_categorizations_on_book_id", unique: true, using: :btree
  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", unique: true, using: :btree

  create_table "checkouts", force: :cascade do |t|
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "reader_id"
  end

  add_index "checkouts", ["book_id"], name: "index_checkouts_on_book_id", using: :btree
  add_index "checkouts", ["reader_id"], name: "index_checkouts_on_reader_id", unique: true, using: :btree

  create_table "readers", force: :cascade do |t|
    t.string "name",         null: false
    t.string "email",        null: false
    t.string "phone_number", null: false
  end

  add_index "readers", ["name"], name: "index_readers_on_name", unique: true, using: :btree

end
