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

ActiveRecord::Schema.define(version: 2021_06_28_010636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "author"
    t.string "publisher"
    t.string "amazon_product_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books", "users"
end



#  SCHEMA 2

# ActiveRecord::Schema.define(version: 2021_06_28_010636) do

#   # These are extensions that must be enabled in order to support this database
#   enable_extension "plpgsql"

#   create_table "books", force: :cascade do |t|
#     t.string "list_name"
#     t.string "updated"
#     t.string "bestsellers_date"
#     t.integer "rank"
#     t.integer "rank_last_week"
#     t.integer "weeks_on_list"
#     t.string "publisher"
#     t.string "published_date"
#     t.string "title"
#     t.string "author"
#     t.text "description"
#     t.string "book_image"
#     # name of online retailer, and connected url
#     t.string "name"
#     t.string "url"
#     t.bigint "user_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["user_id"], name: "index_books_on_user_id"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "username"
#     t.string "password_digest"
#     t.integer "age"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

#   add_foreign_key "books", "users"
# end
