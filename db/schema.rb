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

ActiveRecord::Schema.define(version: 20190207013302) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       default: "", null: false
    t.integer  "parent_id"
    t.integer  "lft",                     null: false
    t.integer  "rgt",                     null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["lft"], name: "index_categories_on_lft", using: :btree
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
    t.index ["rgt"], name: "index_categories_on_rgt", using: :btree
  end

  create_table "item_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       default: "", null: false
    t.integer  "product_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["product_id"], name: "index_item_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                       default: "", null: false
    t.integer  "user_id"
    t.string   "description",                             null: false
    t.string   "category_large",                          null: false
    t.string   "category_middle",                         null: false
    t.string   "category_small",                          null: false
    t.string   "brand"
    t.string   "size",                                    null: false
    t.string   "shipping_charges_burden",                 null: false
    t.integer  "dispatch_area",              default: 0,  null: false
    t.string   "shipping_method",                         null: false
    t.string   "number_of_the_days_to_ship",              null: false
    t.integer  "price",                                   null: false
    t.string   "condition",                               null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",               default: "",           null: false
    t.string   "email",                  default: "",           null: false
    t.string   "encrypted_password",     default: "",           null: false
    t.string   "tel_confirmation",                              null: false
    t.string   "first_name",                                    null: false
    t.string   "last_name",                                     null: false
    t.string   "first_name_kana",                               null: false
    t.string   "last_name_kana",                                null: false
    t.string   "zip",                                           null: false
    t.integer  "prefecture",             default: 0,            null: false
    t.string   "city",                                          null: false
    t.string   "block",                                         null: false
    t.string   "building",               default: ""
    t.string   "phone_number",           default: ""
    t.string   "card_number",                                   null: false
    t.date     "expiration_month",       default: '1900-01-01', null: false
    t.date     "expiration_year",        default: '1900-01-01', null: false
    t.string   "security_code",                                 null: false
    t.string   "profile",                default: ""
    t.date     "birthday",               default: '1900-01-01', null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "item_images", "products"
  add_foreign_key "products", "users"
end
