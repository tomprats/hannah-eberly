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

ActiveRecord::Schema.define(version: 20151105035310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.integer  "primary_painting_id",                 null: false
    t.boolean  "active",              default: false, null: false
    t.integer  "rank",                default: 100,   null: false
    t.string   "name",                                null: false
    t.string   "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "groups", ["active", "rank"], name: "index_groups_on_active_and_rank", using: :btree
  add_index "groups", ["primary_painting_id"], name: "index_groups_on_primary_painting_id", using: :btree
  add_index "groups", ["rank"], name: "index_groups_on_rank", using: :btree

  create_table "paintings", force: :cascade do |t|
    t.integer  "group_id"
    t.boolean  "active",      default: false, null: false
    t.integer  "rank",        default: 100,   null: false
    t.string   "image",                       null: false
    t.string   "name",                        null: false
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "paintings", ["active", "rank"], name: "index_paintings_on_active_and_rank", using: :btree
  add_index "paintings", ["group_id"], name: "index_paintings_on_group_id", using: :btree
  add_index "paintings", ["rank"], name: "index_paintings_on_rank", using: :btree

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",           default: false, null: false
    t.string   "email",                           null: false
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["admin"], name: "index_users_on_admin", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["last_name", "first_name"], name: "index_users_on_last_name_and_first_name", using: :btree

end
