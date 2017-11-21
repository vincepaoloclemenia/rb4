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

ActiveRecord::Schema.define(version: 20171121024033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "brand_id"
    t.integer  "user_id"
    t.string   "action"
    t.string   "involved_record"
  end

  add_index "activities", ["brand_id"], name: "index_activities_on_brand_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "subscription_id"
    t.decimal  "amount",          precision: 15, scale: 2
    t.string   "status"
    t.string   "payer_email"
    t.string   "transaction_id"
    t.string   "plan_name"
    t.text     "branches"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "client_id"
  end

  add_index "bills", ["client_id"], name: "index_bills_on_client_id", using: :btree
  add_index "bills", ["subscription_id"], name: "index_bills_on_subscription_id", using: :btree

  create_table "branch_subscriptions", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "subscription_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "branch_subscriptions", ["branch_id"], name: "index_branch_subscriptions_on_branch_id", using: :btree
  add_index "branch_subscriptions", ["subscription_id"], name: "index_branch_subscriptions_on_subscription_id", using: :btree

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
    t.string   "color"
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

  create_table "categories", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "is_active",      default: true
    t.boolean  "track_as_sales"
    t.boolean  "is_deleted",     default: false
    t.integer  "parent_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "categories", ["brand_id"], name: "index_categories_on_brand_id", using: :btree
  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

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

  create_table "conversions", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "from_unit_id"
    t.integer  "to_unit_id"
    t.decimal  "factor"
    t.boolean  "is_active",    default: true
    t.boolean  "is_deleted",   default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "conversions", ["brand_id"], name: "index_conversions_on_brand_id", using: :btree

  create_table "dashboards", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "brand_id"
    t.integer  "branch_id"
    t.integer  "customer_count"
    t.date     "previous_date_entry"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.decimal  "purchase_total_amount"
    t.decimal  "sales_total_amount"
  end

  add_index "dashboards", ["branch_id"], name: "index_dashboards_on_branch_id", using: :btree
  add_index "dashboards", ["brand_id"], name: "index_dashboards_on_brand_id", using: :btree
  add_index "dashboards", ["client_id"], name: "index_dashboards_on_client_id", using: :btree

  create_table "employee_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "dividend_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "employee_type_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_employed"
    t.integer  "job_id"
    t.date     "birthdate"
    t.string   "contact_no"
    t.string   "sss"
    t.string   "tin"
    t.text     "address"
    t.string   "hdmf"
    t.integer  "age"
    t.string   "philhealth"
    t.string   "position"
    t.string   "position_type"
    t.date     "end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "employees", ["branch_id"], name: "index_employees_on_branch_id", using: :btree
  add_index "employees", ["employee_type_id"], name: "index_employees_on_employee_type_id", using: :btree

  create_table "inventories", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "user_id"
    t.datetime "entry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "inventories", ["branch_id"], name: "index_inventories_on_branch_id", using: :btree
  add_index "inventories", ["user_id"], name: "index_inventories_on_user_id", using: :btree

  create_table "inventory_items", force: :cascade do |t|
    t.integer  "inventory_id"
    t.integer  "item_id"
    t.decimal  "stock_count",  precision: 15, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "inventory_items", ["inventory_id"], name: "index_inventory_items_on_inventory_id", using: :btree
  add_index "inventory_items", ["item_id"], name: "index_inventory_items_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "unit_id"
    t.integer  "category_id"
    t.string   "name"
    t.string   "item_type"
    t.boolean  "is_active",      default: true
    t.boolean  "track_as_sales"
    t.boolean  "is_deleted",     default: false
    t.decimal  "item_value"
    t.string   "item_code"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "items", ["brand_id"], name: "index_items_on_brand_id", using: :btree
  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["unit_id"], name: "index_items_on_unit_id", using: :btree

  create_table "items_suppliers", id: false, force: :cascade do |t|
    t.integer "item_id",     null: false
    t.integer "supplier_id", null: false
  end

  add_index "items_suppliers", ["item_id", "supplier_id"], name: "index_items_suppliers_on_item_id_and_supplier_id", using: :btree

  create_table "labor_hours", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "labor_hours", ["employee_id"], name: "index_labor_hours_on_employee_id", using: :btree

  create_table "labor_hours_entries", force: :cascade do |t|
    t.integer  "labor_hour_id"
    t.date     "working_date"
    t.integer  "branch_id"
    t.decimal  "regular"
    t.decimal  "overtime"
    t.decimal  "night_differential"
    t.decimal  "legal_holiday"
    t.decimal  "special_holiday"
    t.decimal  "absent"
    t.decimal  "late"
    t.decimal  "rest_day"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "manifolds", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "manifolds", ["client_id"], name: "index_manifolds_on_client_id", using: :btree

  create_table "order_lists", force: :cascade do |t|
    t.datetime "po_date"
    t.string   "po_number"
    t.text     "terms"
    t.text     "remarks"
    t.integer  "supplier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status"
    t.string   "pr_number"
    t.datetime "pr_date"
  end

  create_table "order_per_suppliers", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "item_id"
    t.decimal  "price_selected", precision: 16, scale: 2
    t.integer  "branch_id"
    t.integer  "quantity"
    t.string   "unit"
    t.text     "remarks"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "order_list_id"
  end

  create_table "payment_notifications", force: :cascade do |t|
    t.text     "params"
    t.string   "transaction_type"
    t.string   "status"
    t.string   "transaction_id"
    t.integer  "subscription_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "payment_notifications", ["subscription_id"], name: "index_payment_notifications_on_subscription_id", using: :btree

  create_table "per_brand_orders", force: :cascade do |t|
    t.integer  "branch_id"
    t.integer  "order_list_id"
    t.integer  "order_per_supplier_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
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

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "amount",           precision: 15, scale: 2
    t.string   "period"
    t.string   "plan_type"
    t.integer  "brand_limit"
    t.integer  "branch_limit"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "duration_in_days"
  end

  create_table "purchase_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "unit_id"
    t.integer  "purchase_id"
    t.decimal  "quantity"
    t.decimal  "purchase_item_amount",       precision: 16, scale: 2
    t.string   "remarks"
    t.string   "vat_type"
    t.decimal  "purchase_item_total_amount"
    t.integer  "borrowed_from_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "unit_name"
    t.datetime "date_of_purchase"
  end

  add_index "purchase_items", ["item_id"], name: "index_purchase_items_on_item_id", using: :btree
  add_index "purchase_items", ["purchase_id"], name: "index_purchase_items_on_purchase_id", using: :btree
  add_index "purchase_items", ["unit_id"], name: "index_purchase_items_on_unit_id", using: :btree

  create_table "purchase_order_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "unit_id"
    t.integer  "purchase_order_id"
    t.decimal  "quantity"
    t.decimal  "price_selected",    precision: 16, scale: 2
    t.string   "remarks"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "brand_id"
    t.integer  "branch_id"
    t.date     "po_date"
    t.date     "pr_date"
    t.string   "po_number"
    t.string   "pr_number"
    t.text     "remarks"
    t.text     "terms"
    t.string   "status"
    t.integer  "supplier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "brand_id"
    t.integer  "branch_id"
    t.integer  "supplier_id"
    t.date     "purchase_date"
    t.string   "invoice_number"
    t.integer  "user_created_by_id"
    t.integer  "user_modified_by_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "purchases", ["branch_id"], name: "index_purchases_on_branch_id", using: :btree
  add_index "purchases", ["brand_id"], name: "index_purchases_on_brand_id", using: :btree
  add_index "purchases", ["client_id"], name: "index_purchases_on_client_id", using: :btree
  add_index "purchases", ["supplier_id"], name: "index_purchases_on_supplier_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "name"
    t.text     "description"
    t.string   "role_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "roles", ["client_id"], name: "index_roles_on_client_id", using: :btree

  create_table "sale_by_category_entries", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "category_id"
    t.decimal  "amount",                  precision: 16, scale: 2, default: 0.0
    t.datetime "date_created"
    t.integer  "client_id"
    t.integer  "brand_id"
    t.integer  "branch_id"
    t.integer  "subcategory_category_id"
    t.integer  "subcategory_id"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  add_index "sale_by_category_entries", ["category_id"], name: "index_sale_by_category_entries_on_category_id", using: :btree
  add_index "sale_by_category_entries", ["sale_id"], name: "index_sale_by_category_entries_on_sale_id", using: :btree

  create_table "sale_by_settlement_entries", force: :cascade do |t|
    t.integer  "settlement_id"
    t.integer  "sale_id"
    t.integer  "brand_id"
    t.integer  "branch_id"
    t.date     "date_created"
    t.integer  "client_id"
    t.decimal  "amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "sale_by_settlement_entries", ["sale_id"], name: "index_sale_by_settlement_entries_on_sale_id", using: :btree
  add_index "sale_by_settlement_entries", ["settlement_id"], name: "index_sale_by_settlement_entries_on_settlement_id", using: :btree

  create_table "sale_reports", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "title"
    t.integer  "num_of_days"
    t.integer  "total_sales", default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.datetime "date_from"
    t.datetime "date_to"
  end

  add_index "sale_reports", ["brand_id"], name: "index_sale_reports_on_brand_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "customer_count"
    t.integer  "transaction_count"
    t.integer  "branch_id"
    t.integer  "created_by_id"
    t.integer  "first_time_guest"
    t.integer  "repeat_guest"
    t.integer  "brand_id"
    t.integer  "delivery_transaction_count"
    t.integer  "credit_card_transaction_count"
    t.integer  "client_id"
    t.date     "sale_date"
    t.integer  "delivery_sales"
    t.integer  "credit_card_sales"
    t.integer  "service_charge"
    t.integer  "gc_redeemed"
    t.integer  "cash_in_drawer"
    t.integer  "gc_sales"
    t.integer  "other_income"
    t.integer  "vat"
    t.integer  "shift_id"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.string   "daily_sales_record_file_name"
    t.string   "daily_sales_record_content_type"
    t.datetime "daily_sales_record_updated_at"
    t.integer  "daily_sales_record_file_size"
    t.decimal  "net_total_sales",                 precision: 16, scale: 2, default: 0.0
  end

  add_index "sales", ["branch_id"], name: "index_sales_on_branch_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "theme",      default: "Default"
    t.string   "currency",   default: "Philippine Peso"
    t.string   "language",   default: "English"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "client_id"
  end

  add_index "settings", ["client_id"], name: "index_settings_on_client_id", using: :btree

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

  create_table "shifts", force: :cascade do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shifts", ["brand_id"], name: "index_shifts_on_brand_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "plan_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
    t.string   "paypal_customer_token"
    t.string   "paypal_recurring_profile_token"
    t.string   "paypal_email"
    t.string   "paypal_payment_token"
    t.datetime "previous_payment"
    t.datetime "next_payment"
    t.integer  "branch_count"
    t.string   "period"
    t.decimal  "amount",                         precision: 15, scale: 2
    t.decimal  "outstanding_balance",            precision: 15, scale: 2
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "subscriptions", ["client_id"], name: "index_subscriptions_on_client_id", using: :btree
  add_index "subscriptions", ["plan_id"], name: "index_subscriptions_on_plan_id", using: :btree

  create_table "supplier_item_prices", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "item_id"
    t.decimal  "supplier_amount", precision: 16, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "packaging"
    t.integer  "unit_id"
  end

  add_index "supplier_item_prices", ["unit_id"], name: "index_supplier_item_prices_on_unit_id", using: :btree

  create_table "suppliers", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "client_id"
    t.integer  "branch_id"
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "contact_person"
    t.string   "contact_title"
    t.string   "tin"
    t.string   "mobile_no"
    t.string   "fax_no"
    t.string   "landline_no"
    t.boolean  "is_active"
    t.integer  "assigned_to",    default: 1
    t.boolean  "is_deleted",     default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "suppliers", ["branch_id"], name: "index_suppliers_on_branch_id", using: :btree
  add_index "suppliers", ["brand_id"], name: "index_suppliers_on_brand_id", using: :btree
  add_index "suppliers", ["client_id"], name: "index_suppliers_on_client_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "symbol"
    t.string   "remarks"
    t.boolean  "is_active",      default: true
    t.boolean  "track_as_sales"
    t.boolean  "is_deleted",     default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "units", ["brand_id"], name: "index_units_on_brand_id", using: :btree

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

  add_foreign_key "bills", "clients"
  add_foreign_key "bills", "subscriptions"
  add_foreign_key "branch_subscriptions", "branches"
  add_foreign_key "branch_subscriptions", "subscriptions"
  add_foreign_key "branches", "brands"
  add_foreign_key "brands", "clients"
  add_foreign_key "categories", "brands"
  add_foreign_key "client_user_accesses", "branches"
  add_foreign_key "client_user_accesses", "brands"
  add_foreign_key "client_user_accesses", "clients"
  add_foreign_key "client_user_accesses", "roles"
  add_foreign_key "client_user_accesses", "users"
  add_foreign_key "conversions", "brands"
  add_foreign_key "dashboards", "branches"
  add_foreign_key "dashboards", "brands"
  add_foreign_key "dashboards", "clients"
  add_foreign_key "employees", "branches"
  add_foreign_key "employees", "employee_types"
  add_foreign_key "inventories", "branches"
  add_foreign_key "inventories", "users"
  add_foreign_key "inventory_items", "inventories"
  add_foreign_key "inventory_items", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "units"
  add_foreign_key "labor_hours", "employees"
  add_foreign_key "manifolds", "clients"
  add_foreign_key "payment_notifications", "subscriptions"
  add_foreign_key "permissions", "clients"
  add_foreign_key "permissions", "roles"
  add_foreign_key "permissions", "sections"
  add_foreign_key "purchase_items", "items"
  add_foreign_key "purchase_items", "purchases"
  add_foreign_key "purchase_items", "units"
  add_foreign_key "purchases", "branches"
  add_foreign_key "purchases", "brands"
  add_foreign_key "purchases", "clients"
  add_foreign_key "purchases", "suppliers"
  add_foreign_key "roles", "clients"
  add_foreign_key "sale_by_category_entries", "categories"
  add_foreign_key "sale_by_category_entries", "sales"
  add_foreign_key "sale_by_settlement_entries", "sales"
  add_foreign_key "sale_by_settlement_entries", "settlements"
  add_foreign_key "sales", "branches"
  add_foreign_key "settings", "clients"
  add_foreign_key "settlements", "clients"
  add_foreign_key "shifts", "brands"
  add_foreign_key "subscriptions", "clients"
  add_foreign_key "subscriptions", "plans"
  add_foreign_key "suppliers", "branches"
  add_foreign_key "suppliers", "brands"
  add_foreign_key "suppliers", "clients"
  add_foreign_key "units", "brands"
end
