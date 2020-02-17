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

ActiveRecord::Schema.define(version: 20200131233035) do

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

  create_table "alternatives", force: :cascade do |t|
    t.string   "which"
    t.integer  "participants", default: 0
    t.integer  "conversions",  default: 0
    t.text     "experiment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alternatives", ["which"], name: "index_alternatives_on_which", using: :btree

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
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
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
    t.string   "cohort"
    t.text     "notes"
    t.integer  "interview_id"
    t.string   "hangouts_email"
    t.text     "dreams_and_goals"
    t.text     "how_will_you_achieve_goals"
    t.string   "target_date"
    t.text     "why_are_you_the_perfect_candidate"
    t.string   "time_to_reach"
  end

  add_index "applications", ["interview_id"], name: "index_applications_on_interview_id", unique: true, using: :btree

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
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "admin_id"
    t.string   "slug"
    t.boolean  "published?"
    t.date     "posted_date"
    t.boolean  "classic",     default: false
    t.text     "description"
  end

  create_table "capstones", force: :cascade do |t|
    t.string   "project_name"
    t.string   "student_name"
    t.string   "youtube_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "coding_foundations_enrollments", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.boolean  "paid"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "session_id"
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

  create_table "corporate_training_messages", force: :cascade do |t|
    t.string   "company_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_title"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "training_city"
    t.string   "training_state"
    t.string   "team_size"
    t.date     "start_date"
    t.text     "message"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "corporate_training_messages_field_of_interests", id: false, force: :cascade do |t|
    t.integer "corporate_training_message_id", null: false
    t.integer "field_of_interest_id",          null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "faqs", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "priority",   default: 100
    t.string   "category"
  end

  create_table "field_of_interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "info_session_sign_ups", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "city"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "info_session_id"
  end

  create_table "info_sessions", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "booked",     default: false
    t.string   "location"
  end

  create_table "lakewood_applications", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "hangouts_email"
    t.string   "phone"
    t.string   "address"
    t.string   "emergency_contact"
    t.string   "location"
    t.text     "learn_about_acltc"
    t.text     "learn_about_acltc_specify"
    t.text     "primary_goals"
    t.text     "proficiency_with_computers_and_technology"
    t.text     "programming_experience"
    t.text     "current_occupation"
    t.string   "preferred_work_location"
    t.text     "work_concurrently"
    t.text     "why_better"
    t.text     "tinker_example"
    t.text     "dreams_and_goals"
    t.text     "how_will_you_achieve_goals"
    t.text     "capstone_idea"
    t.text     "why_are_you_the_perfect_candidate"
    t.string   "status"
    t.string   "cohort"
    t.text     "notes"
    t.boolean  "scholarship_applicant"
    t.text     "learn_about_scholarship"
    t.boolean  "woman"
    t.boolean  "minority"
    t.text     "why_scholarship"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "currently_a_student"
    t.string   "student_part_or_full_time"
    t.string   "institution_name"
    t.string   "institution_city"
    t.string   "institution_state"
    t.string   "institution_zip"
    t.text     "student_concurrently"
    t.string   "currently_employed"
    t.string   "employed_part_or_full_time"
    t.string   "employer_name"
    t.string   "employer_city"
    t.string   "employer_state"
    t.string   "employer_zip"
    t.text     "employed_concurrently"
  end

  create_table "lakewood_profiles", force: :cascade do |t|
    t.string   "gender"
    t.string   "age"
    t.string   "race"
    t.string   "times_applied"
    t.string   "salary"
    t.string   "credit_score"
    t.string   "financial_network"
    t.string   "savings"
    t.string   "experience_in_coding"
    t.string   "readiness"
    t.integer  "lakewood_application_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

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

  create_table "profiles", force: :cascade do |t|
    t.string   "gender"
    t.string   "age"
    t.string   "race"
    t.string   "times_applied"
    t.string   "salary"
    t.string   "credit_score"
    t.string   "financial_network"
    t.string   "savings"
    t.string   "experience_in_coding"
    t.string   "readiness"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "application_id"
  end

  create_table "referrals", force: :cascade do |t|
    t.string   "referrer_first_name"
    t.string   "referrer_last_name"
    t.string   "referrer_email"
    t.string   "referrer_phone_number"
    t.string   "referred_first_name"
    t.string   "referred_email"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "scholarships", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.text     "dreams_and_goals"
    t.text     "change_your_life"
    t.text     "perfect_candidate"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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

  create_table "social_media", force: :cascade do |t|
    t.datetime "previous_post_time"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "text"
    t.date     "date"
    t.integer  "application_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "lakewood_application_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "first_name"
    t.string   "mousetrap"
    t.string   "ip_address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone"
  end

  create_table "tlase_videos", force: :cascade do |t|
    t.integer  "episode"
    t.string   "vimeo_url"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_url"
  end

  create_table "tours", force: :cascade do |t|
    t.string   "city"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "interview_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "notes"
  end

  create_table "tutorial_submissions", force: :cascade do |t|
    t.string   "lesson_title"
    t.string   "gist_url"
    t.boolean  "reviewed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "applications", "interviews"
end
