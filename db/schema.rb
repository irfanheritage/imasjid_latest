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

ActiveRecord::Schema.define(version: 20170413023609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "address1",    null: false
    t.string   "address2"
    t.integer  "district_id"
    t.integer  "city_id",     null: false
    t.integer  "state_id",    null: false
    t.integer  "country_id",  null: false
    t.string   "zipcode",     null: false
    t.string   "location"
    t.string   "phone"
    t.string   "mobile"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.index ["city_id"], name: "index_addresses_on_city_id", using: :btree
    t.index ["country_id"], name: "index_addresses_on_country_id", using: :btree
    t.index ["district_id"], name: "index_addresses_on_district_id", using: :btree
    t.index ["name"], name: "index_addresses_on_name", using: :btree
    t.index ["state_id"], name: "index_addresses_on_state_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "slug",         null: false
    t.string   "title",        null: false
    t.text     "content",      null: false
    t.string   "author_name",  null: false
    t.string   "source_type"
    t.integer  "source_id"
    t.integer  "category_id"
    t.string   "link"
    t.datetime "available_on"
    t.integer  "views"
    t.datetime "approved_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
    t.index ["author_name"], name: "index_articles_on_author_name", using: :btree
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
    t.index ["slug"], name: "index_articles_on_slug", using: :btree
    t.index ["source_type", "source_id"], name: "index_articles_on_source_type_and_source_id", using: :btree
    t.index ["title"], name: "index_articles_on_title", using: :btree
  end

  create_table "assets", force: :cascade do |t|
    t.string   "viewable_type",           null: false
    t.integer  "viewable_id",             null: false
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.datetime "attachment_updated_at"
    t.string   "type"
    t.string   "position"
    t.integer  "sequence"
    t.text     "alt"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["viewable_type", "viewable_id"], name: "index_assets_on_viewable_type_and_viewable_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "parent_id",                     null: false
    t.integer  "sequence",          default: 0
    t.string   "name",                          null: false
    t.string   "permalink",                     null: false
    t.text     "description"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "depth"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["name"], name: "index_categories_on_name", using: :btree
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "abbr",               null: false
    t.integer  "state_id",           null: false
    t.string   "code"
    t.boolean  "districts_required"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["name"], name: "index_cities_on_name", using: :btree
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "contact_addresses", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "address_id"
    t.boolean  "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_contact_addresses_on_address_id", using: :btree
    t.index ["contact_id"], name: "index_contact_addresses_on_contact_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "gender"
    t.datetime "birth_date"
    t.string   "id_card"
    t.string   "id_card_number"
    t.string   "email"
    t.string   "website"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "google_plus"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "deleted_at"
    t.index ["name"], name: "index_contacts_on_name", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "iso",             null: false
    t.string   "iso3",            null: false
    t.string   "iso_name",        null: false
    t.string   "name",            null: false
    t.integer  "numcode"
    t.boolean  "states_required"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["iso3"], name: "index_countries_on_iso3", using: :btree
    t.index ["name"], name: "index_countries_on_name", using: :btree
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "abbr",       null: false
    t.integer  "city_id",    null: false
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_districts_on_city_id", using: :btree
    t.index ["name"], name: "index_districts_on_name", using: :btree
  end

  create_table "donations", force: :cascade do |t|
    t.string   "name",             null: false
    t.text     "description",      null: false
    t.string   "slug",             null: false
    t.string   "donatable_type"
    t.integer  "donatable_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "available_on"
    t.decimal  "target_amount"
    t.decimal  "collected_amount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "deleted_at"
    t.index ["donatable_type", "donatable_id"], name: "index_donations_on_donatable_type_and_donatable_id", using: :btree
  end

  create_table "event_committees", force: :cascade do |t|
    t.integer  "event_id",    null: false
    t.integer  "contact_id",  null: false
    t.string   "position"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["contact_id"], name: "index_event_committees_on_contact_id", using: :btree
    t.index ["event_id"], name: "index_event_committees_on_event_id", using: :btree
  end

  create_table "event_registrations", force: :cascade do |t|
    t.integer  "event_id",        null: false
    t.integer  "contact_id",      null: false
    t.datetime "registered_at"
    t.datetime "unregistered_at"
    t.text     "remark"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["contact_id"], name: "index_event_registrations_on_contact_id", using: :btree
    t.index ["event_id"], name: "index_event_registrations_on_event_id", using: :btree
  end

  create_table "event_types", force: :cascade do |t|
    t.string   "code",        null: false
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["code"], name: "index_event_types_on_code", using: :btree
    t.index ["name"], name: "index_event_types_on_name", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",            null: false
    t.text     "description"
    t.string   "slug",            null: false
    t.integer  "masjid_id"
    t.string   "location"
    t.string   "location_detail"
    t.integer  "event_type_id"
    t.integer  "category_id"
    t.string   "link"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "available_on"
    t.datetime "reg_start_at"
    t.datetime "reg_end_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "deleted_at"
    t.index ["category_id"], name: "index_events_on_category_id", using: :btree
    t.index ["event_type_id"], name: "index_events_on_event_type_id", using: :btree
    t.index ["masjid_id"], name: "index_events_on_masjid_id", using: :btree
    t.index ["name"], name: "index_events_on_name", using: :btree
    t.index ["slug"], name: "index_events_on_slug", using: :btree
  end

  create_table "finances", force: :cascade do |t|
    t.string   "source_type",      null: false
    t.integer  "source_id",        null: false
    t.datetime "transaction_date"
    t.string   "transaction_type"
    t.text     "description"
    t.string   "code"
    t.decimal  "amount"
    t.decimal  "balance"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["source_type", "source_id"], name: "index_finances_on_source_type_and_source_id", using: :btree
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "masjid_id",       null: false
    t.string   "code"
    t.string   "name",            null: false
    t.text     "description"
    t.string   "brand"
    t.string   "brand_type"
    t.string   "unit_currency"
    t.decimal  "unit_price"
    t.integer  "available_stock"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["masjid_id"], name: "index_inventories_on_masjid_id", using: :btree
  end

  create_table "inventory_histories", force: :cascade do |t|
    t.integer  "inventory_id",     null: false
    t.datetime "transaction_date", null: false
    t.string   "code"
    t.text     "description"
    t.string   "type"
    t.integer  "quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["inventory_id"], name: "index_inventory_histories_on_inventory_id", using: :btree
  end

  create_table "masjid_members", force: :cascade do |t|
    t.integer  "masjid_id",   null: false
    t.string   "type",        null: false
    t.string   "member_type"
    t.integer  "member_id"
    t.json     "preferences"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["masjid_id"], name: "index_masjid_members_on_masjid_id", using: :btree
    t.index ["member_type", "member_id"], name: "index_masjid_members_on_member_type_and_member_id", using: :btree
  end

  create_table "masjids", force: :cascade do |t|
    t.string   "name",           null: false
    t.text     "description"
    t.string   "slug",           null: false
    t.datetime "established_at"
    t.integer  "address_id",     null: false
    t.string   "email"
    t.string   "website"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "google_plus"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "deleted_at"
    t.index ["address_id"], name: "index_masjids_on_address_id", using: :btree
    t.index ["name"], name: "index_masjids_on_name", using: :btree
    t.index ["slug"], name: "index_masjids_on_slug", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "notifiable_type",  null: false
    t.integer  "notifiable_id",    null: false
    t.integer  "masjid_member_id", null: false
    t.string   "state",            null: false
    t.datetime "sent_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["masjid_member_id"], name: "index_notifications_on_masjid_member_id", using: :btree
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id", using: :btree
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "type",                               null: false
    t.string   "name",                               null: false
    t.text     "description"
    t.boolean  "auto_capture",       default: false
    t.boolean  "active",             default: true
    t.integer  "sequence",           default: 0
    t.boolean  "available_to_users", default: true
    t.boolean  "available_to_admin", default: true
    t.json     "preferences"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "deleted_at"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "contact_id",           null: false
    t.string   "payable_type"
    t.integer  "payable_id"
    t.string   "source_type"
    t.integer  "source_id"
    t.decimal  "amount",               null: false
    t.integer  "payment_method_id",    null: false
    t.string   "state",                null: false
    t.text     "remark"
    t.string   "number"
    t.string   "response_code"
    t.string   "avs_response_code"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["contact_id"], name: "index_payments_on_contact_id", using: :btree
    t.index ["payable_type", "payable_id"], name: "index_payments_on_payable_type_and_payable_id", using: :btree
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id", using: :btree
    t.index ["source_type", "source_id"], name: "index_payments_on_source_type_and_source_id", using: :btree
    t.index ["state"], name: "index_payments_on_state", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "abbr",            null: false
    t.integer  "country_id",      null: false
    t.string   "code"
    t.boolean  "cities_required"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
    t.index ["name"], name: "index_states_on_name", using: :btree
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.integer  "masjid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["masjid_id"], name: "index_user_roles_on_masjid_id", using: :btree
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
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
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.integer  "contact_id"
    t.index ["contact_id"], name: "index_users_on_contact_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "districts"
  add_foreign_key "addresses", "states"
  add_foreign_key "articles", "categories"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "cities", "states"
  add_foreign_key "contact_addresses", "addresses"
  add_foreign_key "contact_addresses", "contacts"
  add_foreign_key "districts", "cities"
  add_foreign_key "event_committees", "contacts"
  add_foreign_key "event_committees", "events"
  add_foreign_key "event_registrations", "contacts"
  add_foreign_key "event_registrations", "events"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "event_types"
  add_foreign_key "events", "masjids"
  add_foreign_key "inventories", "masjids"
  add_foreign_key "inventory_histories", "inventories"
  add_foreign_key "masjid_members", "masjids"
  add_foreign_key "masjids", "addresses"
  add_foreign_key "notifications", "masjid_members"
  add_foreign_key "payments", "contacts"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "states", "countries"
  add_foreign_key "user_roles", "masjids"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users", "contacts"
end
