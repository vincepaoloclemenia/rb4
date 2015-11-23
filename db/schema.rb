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

ActiveRecord::Schema.define(version: 20151123021250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "zip"
    t.string   "province_state"
    t.string   "country"
    t.string   "status"
    t.string   "landline_no"
    t.string   "mobile_no"
    t.string   "fax_no"
    t.boolean  "is_franchise"
    t.string   "email_address"
    t.boolean  "breadcrumbs"
    t.boolean  "is_deleted",     default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "branches", ["brand_id"], name: "index_branches_on_brand_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "description"
    t.string   "landline_no"
    t.string   "mobile_no"
    t.string   "fax_no"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_update_at"
    t.string   "website"
    t.boolean  "is_deleted",          default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "brands", ["client_id"], name: "index_brands_on_client_id", using: :btree

  create_table "client_user_accesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "role_id"
    t.integer  "brand_id"
    t.integer  "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "client_user_accesses", ["branch_id"], name: "index_client_user_accesses_on_branch_id", using: :btree
  add_index "client_user_accesses", ["brand_id"], name: "index_client_user_accesses_on_brand_id", using: :btree
  add_index "client_user_accesses", ["client_id"], name: "index_client_user_accesses_on_client_id", using: :btree
  add_index "client_user_accesses", ["role_id"], name: "index_client_user_accesses_on_role_id", using: :btree
  add_index "client_user_accesses", ["user_id"], name: "index_client_user_accesses_on_user_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "landline"
    t.string   "mobile"
    t.string   "fax"
    t.string   "website"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "contact"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_uploaded_at"
    t.integer  "flag",                default: 1
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "section_id"
    t.integer  "client_id"
    t.boolean  "is_create"
    t.boolean  "is_read"
    t.boolean  "is_update"
    t.boolean  "is_destroy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "permissions", ["client_id"], name: "index_permissions_on_client_id", using: :btree
  add_index "permissions", ["role_id"], name: "index_permissions_on_role_id", using: :btree
  add_index "permissions", ["section_id"], name: "index_permissions_on_section_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "name"
    t.text     "description"
    t.string   "role_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "roles", ["client_id"], name: "index_roles_on_client_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "settlements", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_complimentary"
    t.integer  "client_id"
    t.string   "description"
    t.boolean  "is_active"
    t.boolean  "breadcrumbs"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "settlements", ["client_id"], name: "index_settlements_on_client_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.string   "username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "daily_sales_recipient",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "flag",                   default: 6
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "branches", "brands"
  add_foreign_key "brands", "clients"
  add_foreign_key "client_user_accesses", "branches"
  add_foreign_key "client_user_accesses", "brands"
  add_foreign_key "client_user_accesses", "clients"
  add_foreign_key "client_user_accesses", "roles"
  add_foreign_key "client_user_accesses", "users"
  add_foreign_key "permissions", "clients"
  add_foreign_key "permissions", "roles"
  add_foreign_key "permissions", "sections"
  add_foreign_key "roles", "clients"
  add_foreign_key "settlements", "clients"
end
