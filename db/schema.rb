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

ActiveRecord::Schema.define(version: 20181218101834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_teachers", force: :cascade do |t|
    t.integer "category_id"
    t.integer "teacher_id"
  end

  create_table "credits", force: :cascade do |t|
    t.float "total_credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.integer "student_id"
    t.integer "tutor_id"
    t.integer "admin_id"
    t.index ["admin_id"], name: "index_credits_on_admin_id"
    t.index ["post_id"], name: "index_credits_on_post_id"
    t.index ["student_id"], name: "index_credits_on_student_id"
    t.index ["tutor_id"], name: "index_credits_on_tutor_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_languages_on_user_id"
  end

  create_table "languages_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "total_number_of_characters"
    t.integer "total_credits"
    t.integer "bonus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_packages_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "original_text"
    t.text "edited_text"
    t.integer "status"
    t.integer "student_id"
    t.integer "tutor_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "application"
    t.integer "language_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["language_id"], name: "index_posts_on_language_id"
    t.index ["student_id"], name: "index_posts_on_student_id"
    t.index ["tutor_id"], name: "index_posts_on_tutor_id"
  end

  create_table "purchased_packages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_purchased_packages_on_package_id"
    t.index ["user_id"], name: "index_purchased_packages_on_user_id"
  end

  create_table "tag_posts", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "post_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "profile_pic"
    t.string "full_name"
    t.string "occupation"
    t.string "city"
    t.string "country"
    t.datetime "date_of_birth"
    t.integer "gender"
    t.integer "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "super_admin", default: false
    t.boolean "activated", default: false
    t.string "qualification"
    t.string "specialization"
    t.text "about_me"
    t.integer "native_language"
    t.integer "category_id"
    t.index ["category_id"], name: "index_users_on_category_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "languages", "users"
  add_foreign_key "packages", "users"
  add_foreign_key "purchased_packages", "packages"
  add_foreign_key "purchased_packages", "users"
end
