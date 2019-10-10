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

ActiveRecord::Schema.define(version: 20180827117612) do

  create_table "action_definitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "link_attributes"
    t.string "uuid"
    t.string "gduuid"
    t.string "js_function"
    t.string "href"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "access_right"
  end

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "object_id"
    t.string "object_controller_name"
    t.string "headline"
    t.string "owner_id"
    t.string "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "block_definitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "blocktype"
    t.string "uuid"
    t.string "gduuid"
    t.string "model"
    t.string "template_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "conditions"
    t.boolean "enabled"
    t.boolean "is_tab"
    t.boolean "has_filter"
    t.string "action", limit: 45
    t.boolean "has_search"
    t.boolean "has_anchor"
  end

  create_table "chats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "send_from"
    t.string "send_to"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "customer_type"
    t.string "type_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "address"
    t.text "comment"
    t.integer "employees"
    t.boolean "is_broke"
    t.integer "customer_grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doc_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type_name", limit: 45
    t.string "controller_name", limit: 45
    t.string "modelname", limit: 45
    t.string "created_at", limit: 45
  end

  create_table "documents", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "headline", limit: 45
    t.integer "doc_type_id"
    t.integer "author_id"
    t.integer "customer_id"
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "model"
    t.string "object_id"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "field_definitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "uuid"
    t.string "bduuid"
    t.string "field_name"
    t.string "field_type"
    t.string "template_path"
    t.string "attributes_from", limit: 45
    t.string "id_column"
    t.string "value_column"
    t.string "lookup"
    t.integer "min"
    t.integer "max"
    t.boolean "is_required", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "filter_definitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "uuid"
    t.string "bduuid"
    t.string "field_name"
    t.string "field_type"
    t.string "js_function"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_definitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "uuid"
    t.string "action"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_headline", limit: 45
    t.string "enabled", limit: 45
    t.string "unified_group_id", limit: 45
  end

  create_table "homes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "apps", limit: 45
    t.string "enabled_apps", limit: 45
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "user_name"
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.string "birth_day"
    t.string "login_disabled"
    t.string "eos_entity_id"
    t.string "gender"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
