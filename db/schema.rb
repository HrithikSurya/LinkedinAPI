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

ActiveRecord::Schema[7.0].define(version: 2023_11_23_170746) do
  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "sector"
    t.string "location"
    t.string "establishment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "job_profile_id"
    t.integer "user_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.index ["job_profile_id"], name: "index_job_applications_on_job_profile_id"
    t.index ["user_profile_id"], name: "index_job_applications_on_user_profile_id"
  end

  create_table "job_profiles", force: :cascade do |t|
    t.string "title"
    t.string "job_description"
    t.string "no_of_openings"
    t.string "requirement"
    t.string "skills_required"
    t.integer "company_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_job_profiles_on_company_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "title"
    t.string "designation"
    t.string "experience"
    t.string "qualification"
    t.string "skill_set"
    t.string "location"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "job_profiles", "companies"
  add_foreign_key "user_profiles", "users"
end
