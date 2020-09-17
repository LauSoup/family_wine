# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_17_072604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conso_tags", force: :cascade do |t|
    t.string "conso_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "wine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["wine_id"], name: "index_favorites_on_wine_id"
  end

  create_table "prices", force: :cascade do |t|
    t.string "price_fork"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "region_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wine_consos", force: :cascade do |t|
    t.bigint "wine_id", null: false
    t.bigint "conso_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conso_tag_id"], name: "index_wine_consos_on_conso_tag_id"
    t.index ["wine_id"], name: "index_wine_consos_on_wine_id"
  end

  create_table "wines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "price_id", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "country"
    t.index ["price_id"], name: "index_wines_on_price_id"
    t.index ["region_id"], name: "index_wines_on_region_id"
    t.index ["user_id"], name: "index_wines_on_user_id"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "wines"
  add_foreign_key "wine_consos", "conso_tags"
  add_foreign_key "wine_consos", "wines"
  add_foreign_key "wines", "prices"
  add_foreign_key "wines", "regions"
  add_foreign_key "wines", "users"
end
