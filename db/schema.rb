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

ActiveRecord::Schema.define(version: 20170608185607) do

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_countries_on_user_id"
  end

  create_table "field_interests", force: :cascade do |t|
    t.string   "name"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_field_interests_on_student_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.string   "friendable_type"
    t.integer  "friendable_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id"
    t.integer  "status"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_languages_on_user_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string   "name"
    t.text     "search_preferences"
    t.text     "bio"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "school"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "school"
    t.text     "bio"
    t.float    "gpa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "meta_id"
    t.string   "meta_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["meta_id", "meta_type"], name: "index_users_on_meta_id_and_meta_type"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
