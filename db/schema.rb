# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_03_212038) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "credit_cards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "wallet_id", null: false
    t.integer "expire_day", null: false
    t.integer "cut_day", null: false
    t.string "name", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_credit_cards_on_wallet_id"
  end

  create_table "credits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "value", precision: 9, scale: 2, null: false
    t.uuid "wallet_id", null: false
    t.date "date"
    t.string "description"
    t.string "credit_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_credits_on_wallet_id"
  end

  create_table "debts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "value", precision: 9, scale: 2, null: false
    t.uuid "wallet_id", null: false
    t.date "date"
    t.integer "terms"
    t.string "description"
    t.string "debt_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "credit_card_id"
    t.index ["credit_card_id"], name: "index_debts_on_credit_card_id"
    t.index ["wallet_id"], name: "index_debts_on_wallet_id"
  end

  create_table "installments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "debt_id", null: false
    t.decimal "value", precision: 9, scale: 2, null: false
    t.date "expire_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debt_id"], name: "index_installments_on_debt_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "balance", precision: 9, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "credit_cards", "wallets"
  add_foreign_key "credits", "wallets"
  add_foreign_key "debts", "credit_cards"
  add_foreign_key "debts", "wallets"
  add_foreign_key "installments", "debts"
  add_foreign_key "wallets", "users"
end
