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

ActiveRecord::Schema.define(version: 20161222162319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "main_type",     default: "class", null: false
    t.string   "original_name"
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["main_type"], name: "index_categories_on_main_type", using: :btree
    t.index ["name"], name: "index_categories_on_name", using: :btree
    t.index ["original_name"], name: "index_categories_on_original_name", using: :btree
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "experiments", force: :cascade do |t|
    t.string   "sequence",    null: false
    t.string   "genbank_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position_id", null: false
    t.index ["genbank_id"], name: "index_experiments_on_genbank_id", using: :btree
    t.index ["position_id"], name: "index_experiments_on_position_id", using: :btree
  end

  create_table "genetic_markers", force: :cascade do |t|
    t.string   "marker",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marker"], name: "index_genetic_markers_on_marker", using: :btree
  end

  create_table "position_photos", force: :cascade do |t|
    t.integer  "priority",    default: 0, null: false
    t.string   "photo",                   null: false
    t.integer  "position_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["position_id"], name: "index_position_photos_on_position_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.string   "original_name"
    t.string   "name"
    t.text     "description"
    t.text     "importance"
    t.text     "restriction_map"
    t.string   "aligned_sequence"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "genetic_marker_id"
    t.integer  "useful_type_id"
    t.index ["genetic_marker_id"], name: "index_positions_on_genetic_marker_id", using: :btree
    t.index ["name"], name: "index_positions_on_name", using: :btree
    t.index ["original_name"], name: "index_positions_on_original_name", using: :btree
    t.index ["useful_type_id"], name: "index_positions_on_useful_type_id", using: :btree
  end

  create_table "positions_categories", primary_key: ["position_id", "category_id"], force: :cascade do |t|
    t.integer "position_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_positions_categories_on_category_id", using: :btree
    t.index ["position_id"], name: "index_positions_categories_on_position_id", using: :btree
  end

  create_table "positions_primers", primary_key: ["position_id", "primer_id"], force: :cascade do |t|
    t.integer "position_id", null: false
    t.integer "primer_id",   null: false
    t.index ["position_id"], name: "index_positions_primers_on_position_id", using: :btree
    t.index ["primer_id"], name: "index_positions_primers_on_primer_id", using: :btree
  end

  create_table "primers", force: :cascade do |t|
    t.string   "code",                           null: false
    t.string   "sequence",                       null: false
    t.string   "direction",  default: "forward", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["code"], name: "index_primers_on_code", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_roles_on_slug", using: :btree
  end

  create_table "useful_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_useful_types_on_parent_id", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "realname"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", primary_key: ["user_id", "role_id"], force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

end
