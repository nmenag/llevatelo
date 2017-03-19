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

ActiveRecord::Schema.define(version: 20170319010340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_images", force: :cascade do |t|
    t.integer  "article_id",      null: false
    t.string   "image_file_name", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["article_id"], name: "index_article_images_on_article_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "name",        limit: 100, null: false
    t.text     "description",             null: false
    t.string   "location",                null: false
    t.integer  "status"
    t.integer  "offer_type",              null: false
    t.integer  "user_id",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id"
    t.string   "photo"
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "status",     default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "favorited_type"
    t.integer  "favorited_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["favorited_type", "favorited_id"], name: "index_favorites_on_favorited_type_and_favorited_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "status",                 default: false, null: false
    t.integer  "role",                                   null: false
    t.string   "phone",                                  null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "picture"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "article_images", "articles"
  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "users"
  add_foreign_key "favorites", "users"
end
