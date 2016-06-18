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

ActiveRecord::Schema.define(version: 20160618160917) do

  create_table "articles", force: :cascade do |t|
    t.string   "text",       limit: 255
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "user_login", limit: 255
  end

  add_index "articles", ["user_login"], name: "articles_to_users", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "text",       limit: 255
    t.string   "user_login", limit: 255
    t.integer  "article_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree
  add_index "comments", ["user_login"], name: "comments_to_users", using: :btree

  create_table "users", primary_key: "login", force: :cascade do |t|
    t.string   "first_name",    limit: 255, null: false
    t.string   "last_name",     limit: 255, null: false
    t.string   "password_hash", limit: 255, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "articles", "users", column: "user_login", primary_key: "login", name: "articles_to_users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users", column: "user_login", primary_key: "login", name: "comments_to_users"
end