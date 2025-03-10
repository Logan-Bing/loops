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

ActiveRecord::Schema[7.1].define(version: 2025_03_10_143848) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fidelity_programs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.integer "points_per_euro"
    t.boolean "active"
    t.datetime "created"
    t.datetime "updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fidelity_programs_on_user_id"
  end

  create_table "inscription_rewards", force: :cascade do |t|
    t.bigint "inscription_id", null: false
    t.bigint "reward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inscription_id"], name: "index_inscription_rewards_on_inscription_id"
    t.index ["reward_id"], name: "index_inscription_rewards_on_reward_id"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fidelity_program_id", null: false
    t.datetime "created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fidelity_program_id"], name: "index_inscriptions_on_fidelity_program_id"
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "points"
    t.bigint "inscription_id", null: false
    t.datetime "created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inscription_id"], name: "index_participations_on_inscription_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.bigint "fidelity_program_id", null: false
    t.string "name"
    t.string "description"
    t.integer "points_required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fidelity_program_id"], name: "index_rewards_on_fidelity_program_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "business_name"
    t.string "business_address"
    t.string "role"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fidelity_programs", "users"
  add_foreign_key "inscription_rewards", "inscriptions"
  add_foreign_key "inscription_rewards", "rewards"
  add_foreign_key "inscriptions", "fidelity_programs"
  add_foreign_key "inscriptions", "users"
  add_foreign_key "participations", "inscriptions"
  add_foreign_key "rewards", "fidelity_programs"
end
