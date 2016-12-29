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

ActiveRecord::Schema.define(version: 20161229145251) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "auto_logins", force: :cascade do |t|
    t.string   "public_key"
    t.string   "private_key"
    t.integer  "date"
    t.integer  "ip"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "emails", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "address"
    t.string   "provider"
    t.string   "kind"
    t.boolean  "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_emails_on_address"
    t.index ["person_id"], name: "index_emails_on_person_id"
    t.index ["provider"], name: "index_emails_on_provider"
  end

  create_table "forced_group_emails", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "regex"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_forced_group_emails_on_group_id"
  end

  create_table "forced_group_ips", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "low"
    t.integer  "high"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_forced_group_ips_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "precedence"
    t.bigint   "perm_add"
    t.bigint   "perm_remove"
    t.text     "perm"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "monickers", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "name_type"
    t.integer  "name_id"
    t.string   "kind"
    t.boolean  "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_type", "name_id"], name: "index_monickers_on_name_type_and_name_id"
    t.index ["person_id"], name: "index_monickers_on_person_id"
  end

  create_table "one_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_one_names_on_name"
  end

  create_table "other_addresses", force: :cascade do |t|
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["parent_id"], name: "index_permissions_on_parent_id"
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "number"
    t.string   "provider"
    t.string   "kind"
    t.boolean  "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_phones_on_number"
    t.index ["person_id"], name: "index_phones_on_person_id"
    t.index ["provider"], name: "index_phones_on_provider"
  end

  create_table "queued_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "salt"
    t.integer  "iterations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residences", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "address_type"
    t.integer  "address_id"
    t.string   "kind"
    t.boolean  "primary"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["address_type", "address_id"], name: "index_residences_on_address_type_and_address_id"
    t.index ["person_id"], name: "index_residences_on_person_id"
  end

  create_table "rights", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["permission_id"], name: "index_rights_on_permission_id"
    t.index ["role_id"], name: "index_rights_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "precedence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "three_names", force: :cascade do |t|
    t.string   "title"
    t.string   "given"
    t.string   "middle"
    t.string   "family"
    t.string   "suffix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family"], name: "index_three_names_on_family"
    t.index ["given"], name: "index_three_names_on_given"
  end

  create_table "usa_addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "street"
    t.string   "apartment"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.integer  "extension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_usa_addresses_on_city"
    t.index ["name"], name: "index_usa_addresses_on_name"
    t.index ["state"], name: "index_usa_addresses_on_state"
    t.index ["street"], name: "index_usa_addresses_on_street"
    t.index ["zipcode"], name: "index_usa_addresses_on_zipcode"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "email"
    t.string   "client_salt"
    t.string   "server_salt"
    t.integer  "iterations"
    t.string   "passhash"
    t.bigint   "perm_override_add"
    t.bigint   "perm_override_remove"
    t.text     "perm_override"
    t.integer  "reg_date"
    t.integer  "reg_ip"
    t.integer  "log_dat"
    t.integer  "log_ip"
    t.integer  "state"
    t.string   "status"
    t.text     "details"
    t.text     "auxillary"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["person_id"], name: "index_users_on_person_id"
  end

end
