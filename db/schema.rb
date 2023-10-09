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

ActiveRecord::Schema[7.0].define(version: 20_231_009_205_348) do
  create_table 'companies', force: :cascade do |t|
    t.string 'company_name'
    t.string 'sector'
    t.string 'location'
    t.string 'establishment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'job_profiles', force: :cascade do |t|
    t.string 'title'
    t.string 'job_description'
    t.string 'no_of_openings'
    t.string 'requirement'
    t.string 'skills_required'
    t.integer 'company_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_job_profiles_on_company_id'
  end

  create_table 'user_profiles', force: :cascade do |t|
    t.string 'title'
    t.string 'designation'
    t.string 'experience'
    t.string 'qualification'
    t.string 'skill_set'
    t.string 'location'
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_user_profiles_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'role'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password'
  end

  add_foreign_key 'job_profiles', 'companies'
  add_foreign_key 'user_profiles', 'users'
end
