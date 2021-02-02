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

ActiveRecord::Schema.define(version: 2021_02_02_203051) do

  create_table "coins", force: :cascade do |t|
    t.string "name"
    t.decimal "value"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coinwallets", force: :cascade do |t|
    t.integer "coin_id"
    t.integer "wallet_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coin_id"], name: "index_coinwallets_on_coin_id"
    t.index ["wallet_id"], name: "index_coinwallets_on_wallet_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "sender_wallet_id"
    t.integer "receiver_wallet_id"
    t.decimal "amount"
    t.datetime "timestamp"
    t.decimal "fee"
    t.string "transaction_id"
    t.decimal "hash_rate"
    t.string "category"
    t.string "status"
    t.string "coin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_wallet_id"], name: "index_transactions_on_receiver_wallet_id"
    t.index ["sender_wallet_id"], name: "index_transactions_on_sender_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.text "public_key"
    t.text "private_key"
    t.decimal "total_invested"
    t.integer "owner_id"
    t.string "password_digest"
    t.string "api_key"
    t.text "seed_phrase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_wallets_on_owner_id"
  end

end
