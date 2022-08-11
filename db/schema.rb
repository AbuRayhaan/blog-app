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

ActiveRecord ::Schema.define do
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |i|
    i.bigint "author_id", null: false
    i.bigint "post_id", null: false
    i.text "text"
    i.datetime "created_at", null: false
    i.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |i|
    i.bigint "author_id", null: false
    i.bigint "post_id", null: false
    i.datetime "created_at", null: false
    i.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |i|
    i.string "name", null: false
    i.photo "photo"
    i.string "bio"
    i.integer "posts_counter"
    i.datetime "created_at", null: false
    i.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |i|
    i.bigint "author_id", null: false
    i.string "title"
    i.text "text"
    i.datetime "created_at", null: false
    i.datetime "updated_at", null: false
    i.integer "comments_counter"
    i.integer "likes_counter"
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users", column: "author_id"
  add_foreign_key "posts", "users", column: "author_id"
end