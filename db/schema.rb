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

ActiveRecord::Schema.define(version: 20161101002251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "capstones", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "screenshot"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false

  end

  create_table "educations", force: :cascade do |t|
    t.string   "start_date"
    t.string   "end_date"
    t.string   "degree"
    t.string   "university_name"
    t.text     "details"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"

  end

  create_table "experiences", force: :cascade do |t|
    t.string   "start_date"
    t.string   "end_date"
    t.string   "job_title"
    t.string   "commpany_name"
    t.text     "details"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "student_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "short_bio"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "blog"
    t.string   "online_resume"
    t.string   "github"
    t.string   "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
