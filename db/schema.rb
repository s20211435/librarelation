# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_10_11_033734) do

  create_table "dealings", force: :cascade do |t|
    t.string "isbn_number"
    t.string "title"
    t.string "author_name"
    t.integer "condition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "new_books", force: :cascade do |t|
    t.string "isbn_number"
    t.string "title"
    t.string "author_name"
    t.date "arrival_day"
    t.integer "lending"
    t.integer "book_number"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.string "isbn_number"
    t.string "title"
    t.string "author_name"
    t.integer "book_rank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommend_books", force: :cascade do |t|
    t.string "ISBN_number"
    t.string "title"
    t.string "author_name"
    t.string "recommend"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "isbn_number"
    t.string "title"
    t.string "author_name"
    t.string "reason"
    t.string "grade"
    t.string "class"
    t.string "number"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
