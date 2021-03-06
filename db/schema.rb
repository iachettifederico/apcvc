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

ActiveRecord::Schema.define(version: 20140308215720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.date     "from_date"
    t.date     "to_date"
    t.boolean  "front_page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "code"
    t.string   "edition"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dir_comissions", force: :cascade do |t|
    t.integer  "order"
    t.string   "name"
    t.string   "position"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "essays", force: :cascade do |t|
    t.string   "title"
    t.string   "document"
    t.string   "authors"
    t.text     "abstract"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "content"
    t.string   "poster"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "front_page"
    t.boolean  "announcement"
  end

  create_table "secretaries", force: :cascade do |t|
    t.integer  "order"
    t.string   "key"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "order"
    t.string   "key"
    t.text     "value"
    t.string   "field_type"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "trainings", force: :cascade do |t|
    t.integer  "order"
    t.string   "key"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "pubdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
