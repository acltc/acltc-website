# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160329202348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.text     "bio"
    t.string   "avatar"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "applications", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "learn_about_acltc"
    t.text     "current_occupation"
    t.text     "primary_goals"
    t.text     "programming_experience"
    t.string   "preferred_work_location"
    t.text     "capstone_idea"
    t.text     "work_concurrently"
    t.text     "tinker_example"
    t.text     "why_better"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "address"
    t.string   "emergency_contact"
    t.boolean  "scholarship_applicant"
    t.text     "learn_about_scholarship"
    t.boolean  "woman"
    t.boolean  "minority"
    t.text     "why_scholarship"
    t.string   "location"
    t.text     "learn_about_acltc_specify"
    t.string   "status"
  end

  create_table "blog_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_categories_posts", id: false, force: :cascade do |t|
    t.integer "blog_post_id",     null: false
    t.integer "blog_category_id", null: false
  end

  create_table "blog_pics", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "blog_post_id"
    t.string   "blog_pic"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "admin_id"
    t.string   "slug"
    t.boolean  "published?"
    t.date     "posted_date"
  end

  create_table "capstones", force: :cascade do |t|
    t.string   "project_name"
    t.string   "student_name"
    t.string   "youtube_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "location"
  end

  create_table "faqs", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "priority",   default: 100
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "mini_course_applications", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "statement"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "mini_course_id"
    t.string   "email"
    t.string   "phone"
  end

  create_table "mini_courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "location_id"
    t.text     "description"
    t.text     "skills_learned"
    t.text     "prerequisites"
  end

  create_table "screencasts", force: :cascade do |t|
    t.string   "cover_image"
    t.string   "youtube_id"
    t.string   "name"
    t.text     "description"
    t.integer  "priority"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
