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

ActiveRecord::Schema.define(version: 2019_10_28_033754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "name", null: false
    t.text "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "condition_id", null: false
    t.bigint "clan_id", null: false
    t.bigint "listing_id", null: false
    t.index ["clan_id"], name: "index_cards_on_clan_id"
    t.index ["condition_id"], name: "index_cards_on_condition_id"
    t.index ["listing_id"], name: "index_cards_on_listing_id"
  end

  create_table "clans", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string "title", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "card_id", null: false
    t.index ["card_id"], name: "index_orders_on_card_id"
  end

  add_foreign_key "cards", "clans"
  add_foreign_key "cards", "conditions"
  add_foreign_key "cards", "listings"
  add_foreign_key "orders", "cards"
end
