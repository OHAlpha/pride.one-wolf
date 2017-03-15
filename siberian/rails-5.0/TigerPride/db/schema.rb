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

ActiveRecord::Schema.define(version: 20170216202244) do

  create_table "accounts", force: :cascade do |t|
    t.string   "account"
    t.string   "private_key"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "display"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["account"], name: "index_accounts_on_account", unique: true
    t.index ["private_key"], name: "index_accounts_on_private_key"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.string   "appointment"
    t.string   "private_key"
    t.integer  "account_id"
    t.integer  "role_id"
    t.integer  "authorized_by_id"
    t.integer  "state"
    t.string   "status"
    t.text     "details"
    t.text     "auxillary"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["account_id"], name: "index_appointments_on_account_id"
    t.index ["appointment"], name: "index_appointments_on_appointment", unique: true
    t.index ["authorized_by_id"], name: "index_appointments_on_authorized_by_id"
    t.index ["private_key"], name: "index_appointments_on_private_key"
    t.index ["role_id"], name: "index_appointments_on_role_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.string   "assignment"
    t.string   "private_key"
    t.integer  "account_id"
    t.integer  "group_id"
    t.integer  "authorized_by_id"
    t.integer  "state"
    t.string   "status"
    t.text     "details"
    t.text     "auxillary"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["account_id"], name: "index_assignments_on_account_id"
    t.index ["assignment"], name: "index_assignments_on_assignment", unique: true
    t.index ["authorized_by_id"], name: "index_assignments_on_authorized_by_id"
    t.index ["group_id"], name: "index_assignments_on_group_id"
    t.index ["private_key"], name: "index_assignments_on_private_key"
  end

  create_table "auto_logins", force: :cascade do |t|
    t.string   "auto_login"
    t.string   "private_key"
    t.integer  "login_id"
    t.string   "public_key"
    t.integer  "date"
    t.integer  "ip"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["auto_login"], name: "index_auto_logins_on_auto_login", unique: true
    t.index ["login_id"], name: "index_auto_logins_on_login_id"
    t.index ["private_key"], name: "index_auto_logins_on_private_key"
  end

  create_table "credentials", force: :cascade do |t|
    t.string   "credential"
    t.string   "private_key"
    t.integer  "account_id"
    t.bigint   "perm_override_add"
    t.bigint   "perm_override_remove"
    t.text     "perm_override"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["account_id"], name: "index_credentials_on_account_id"
    t.index ["credential"], name: "index_credentials_on_credential", unique: true
    t.index ["private_key"], name: "index_credentials_on_private_key"
  end

  create_table "development_registers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "client_salt"
    t.integer  "iterations"
    t.string   "client_hash"
    t.string   "server_salt"
    t.string   "server_hash"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "emails", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "added_by_id"
    t.string   "address"
    t.string   "provider"
    t.string   "kind"
    t.boolean  "primary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "email"
    t.index ["added_by_id"], name: "index_emails_on_added_by_id"
    t.index ["address"], name: "index_emails_on_address"
    t.index ["email"], name: "index_emails_on_email"
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
    t.integer  "kind"
    t.integer  "low"
    t.integer  "high"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_forced_group_ips_on_group_id"
  end

  create_table "group_priveledges", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "target_id"
    t.integer  "added_by_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["added_by_id"], name: "index_group_priveledges_on_added_by_id"
    t.index ["owner_id"], name: "index_group_priveledges_on_owner_id"
    t.index ["target_id"], name: "index_group_priveledges_on_target_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group"
    t.string   "private_key"
    t.integer  "organization_id"
    t.integer  "added_by_id"
    t.string   "name"
    t.text     "description"
    t.integer  "precedence"
    t.bigint   "perm_add"
    t.bigint   "perm_remove"
    t.text     "perm"
    t.integer  "state"
    t.string   "status"
    t.text     "details"
    t.text     "auxillary"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["added_by_id"], name: "index_groups_on_added_by_id"
    t.index ["group"], name: "index_groups_on_group", unique: true
    t.index ["organization_id"], name: "index_groups_on_organization_id"
    t.index ["private_key"], name: "index_groups_on_private_key"
  end

  create_table "languages", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "added_by_id"
    t.string   "language"
    t.string   "kind"
    t.boolean  "primary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["added_by_id"], name: "index_languages_on_added_by_id"
    t.index ["language"], name: "index_languages_on_language"
    t.index ["person_id"], name: "index_languages_on_person_id"
  end

  create_table "logins", force: :cascade do |t|
    t.string   "login"
    t.string   "private_key"
    t.integer  "account_id"
    t.integer  "email_id"
    t.string   "client_salt"
    t.string   "server_salt"
    t.integer  "iterations"
    t.string   "passhash"
    t.string   "version"
    t.boolean  "primary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["account_id"], name: "index_logins_on_account_id"
    t.index ["email_id"], name: "index_logins_on_email_id"
    t.index ["login"], name: "index_logins_on_login", unique: true
    t.index ["private_key"], name: "index_logins_on_private_key"
  end

  create_table "members", force: :cascade do |t|
    t.string   "member"
    t.string   "private_key"
    t.integer  "account_id"
    t.integer  "organization_id"
    t.integer  "authorized_by_id"
    t.integer  "state"
    t.string   "status"
    t.text     "details"
    t.text     "auxillary"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["account_id"], name: "index_members_on_account_id"
    t.index ["authorized_by_id"], name: "index_members_on_authorized_by_id"
    t.index ["member"], name: "index_members_on_member", unique: true
    t.index ["organization_id"], name: "index_members_on_organization_id"
    t.index ["private_key"], name: "index_members_on_private_key"
  end

  create_table "monickers", force: :cascade do |t|
    t.string   "monicker"
    t.string   "private_key"
    t.integer  "person_id"
    t.string   "name_type"
    t.integer  "name_id"
    t.integer  "added_by_id"
    t.string   "kind"
    t.boolean  "primary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["added_by_id"], name: "index_monickers_on_added_by_id"
    t.index ["monicker"], name: "index_monickers_on_monicker", unique: true
    t.index ["name_type", "name_id"], name: "index_monickers_on_name_type_and_name_id"
    t.index ["person_id"], name: "index_monickers_on_person_id"
    t.index ["private_key"], name: "index_monickers_on_private_key"
  end

  create_table "name_prefixes", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "name_suffixes", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "one_names", force: :cascade do |t|
    t.string   "name"
    t.integer  "uses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_one_names_on_name"
  end

  create_table "operations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["parent_id"], name: "index_operations_on_parent_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "organization"
    t.string   "private_key"
    t.integer  "parent_id"
    t.integer  "permission_set_id"
    t.integer  "added_by_id"
    t.string   "name"
    t.text     "description"
    t.integer  "state"
    t.string   "status"
    t.text     "details"
    t.text     "auxillary"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["added_by_id"], name: "index_organizations_on_added_by_id"
    t.index ["organization"], name: "index_organizations_on_organization", unique: true
    t.index ["parent_id"], name: "index_organizations_on_parent_id"
    t.index ["permission_set_id"], name: "index_organizations_on_permission_set_id"
    t.index ["private_key"], name: "index_organizations_on_private_key"
  end

  create_table "other_addresses", force: :cascade do |t|
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_other_names_on_name"
  end

  create_table "people", force: :cascade do |t|
    t.string   "person"
    t.string   "private_key"
    t.integer  "added_by_id"
    t.string   "gender"
    t.integer  "state"
    t.string   "status"
    t.text     "details"
    t.text     "auxillary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["added_by_id"], name: "index_people_on_added_by_id"
    t.index ["person"], name: "index_people_on_person", unique: true
    t.index ["private_key"], name: "index_people_on_private_key"
  end

  create_table "permission_sets", force: :cascade do |t|
    t.string   "permission_set"
    t.string   "private_key"
    t.integer  "permissions"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["permission_set"], name: "index_permission_sets_on_permission_set", unique: true
    t.index ["private_key"], name: "index_permission_sets_on_private_key"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "permission_set_id"
    t.string   "name"
    t.text     "description"
    t.string   "kind"
    t.string   "visibility"
    t.string   "key"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["permission_set_id"], name: "index_permissions_on_permission_set_id"
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "added_by_id"
    t.string   "number"
    t.string   "provider"
    t.string   "kind"
    t.boolean  "primary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["added_by_id"], name: "index_phones_on_added_by_id"
    t.index ["number"], name: "index_phones_on_number"
    t.index ["person_id"], name: "index_phones_on_person_id"
    t.index ["provider"], name: "index_phones_on_provider"
  end

  create_table "queued_users", force: :cascade do |t|
    t.string   "queued_user"
    t.string   "private_key"
    t.string   "name"
    t.string   "email"
    t.string   "salt"
    t.integer  "iterations"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["private_key"], name: "index_queued_users_on_private_key"
    t.index ["queued_user"], name: "index_queued_users_on_queued_user", unique: true
  end

  create_table "relationship_types", force: :cascade do |t|
    t.string   "name"
    t.string   "parent"
    t.string   "inverse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "person_a_id"
    t.integer  "person_b_id"
    t.string   "kind"
    t.integer  "added_by_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["added_by_id"], name: "index_relationships_on_added_by_id"
    t.index ["person_a_id"], name: "index_relationships_on_person_a_id"
    t.index ["person_b_id"], name: "index_relationships_on_person_b_id"
  end

  create_table "residences", force: :cascade do |t|
    t.string   "residence"
    t.string   "private_key"
    t.integer  "person_id"
    t.string   "address_type"
    t.integer  "address_id"
    t.integer  "added_by_id"
    t.string   "kind"
    t.boolean  "primary"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["added_by_id"], name: "index_residences_on_added_by_id"
    t.index ["address_type", "address_id"], name: "index_residences_on_address_type_and_address_id"
    t.index ["person_id"], name: "index_residences_on_person_id"
    t.index ["private_key"], name: "index_residences_on_private_key"
    t.index ["residence"], name: "index_residences_on_residence", unique: true
  end

  create_table "rights", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.string   "kind"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["permission_id"], name: "index_rights_on_permission_id"
    t.index ["role_id"], name: "index_rights_on_role_id"
  end

  create_table "role_priveledges", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "target_id"
    t.integer  "added_by_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["added_by_id"], name: "index_role_priveledges_on_added_by_id"
    t.index ["owner_id"], name: "index_role_priveledges_on_owner_id"
    t.index ["target_id"], name: "index_role_priveledges_on_target_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.string   "private_key"
    t.integer  "organization_id"
    t.integer  "added_by_id"
    t.string   "name"
    t.text     "description"
    t.integer  "precedence"
    t.integer  "state"
    t.string   "status"
    t.text     "details"
    t.text     "auxillary"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["added_by_id"], name: "index_roles_on_added_by_id"
    t.index ["organization_id"], name: "index_roles_on_organization_id"
    t.index ["private_key"], name: "index_roles_on_private_key"
    t.index ["role"], name: "index_roles_on_role", unique: true
  end

  create_table "three_names", force: :cascade do |t|
    t.string   "title"
    t.string   "given"
    t.string   "middle"
    t.string   "family"
    t.string   "suffix"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family"], name: "index_three_names_on_family"
    t.index ["given"], name: "index_three_names_on_given"
    t.index ["name"], name: "index_three_names_on_name"
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
    t.string   "user"
    t.string   "private_key"
    t.integer  "person_id"
    t.string   "name"
    t.integer  "reg_date"
    t.integer  "reg_ip"
    t.integer  "log_dat"
    t.integer  "log_ip"
    t.integer  "state"
    t.string   "status"
    t.text     "details"
    t.text     "auxillary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["person_id"], name: "index_users_on_person_id"
    t.index ["private_key"], name: "index_users_on_private_key"
    t.index ["user"], name: "index_users_on_user", unique: true
  end

end
