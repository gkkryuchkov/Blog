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

ActiveRecord::Schema.define(version: 2020_03_14_065251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_mes", force: :cascade do |t|
    t.text "body", default: "test", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.text "body", null: false
    t.bigint "section_id"
    t.bigint "user_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "publish_date"
    t.integer "hidden", default: 1
    t.string "slug"
    t.index ["section_id"], name: "index_articles_on_section_id"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
    t.index ["user_profile_id"], name: "index_articles_on_user_profile_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "rating"
    t.text "comment_body"
    t.bigint "user_profile_id"
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_comment_id"
    t.integer "edited", default: 0
    t.integer "deleted", default: 0
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["parent_comment_id"], name: "index_comments_on_parent_comment_id"
    t.index ["user_profile_id"], name: "index_comments_on_user_profile_id"
  end

  create_table "favorite_articles", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "user_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_favorite_articles_on_article_id"
    t.index ["user_profile_id"], name: "index_favorite_articles_on_user_profile_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "text"
    t.bigint "article_id"
    t.bigint "comment_id"
    t.bigint "user_profile_id"
    t.integer "seen", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_notifications_on_article_id"
    t.index ["comment_id"], name: "index_notifications_on_comment_id"
    t.index ["user_profile_id"], name: "index_notifications_on_user_profile_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "username"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_user_profiles_on_slug", unique: true
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usr_com_ratings", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "comment_id"
    t.integer "rating", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_usr_com_ratings_on_comment_id"
    t.index ["user_profile_id"], name: "index_usr_com_ratings_on_user_profile_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "sections"
  add_foreign_key "articles", "user_profiles"
  add_foreign_key "notifications", "articles"
  add_foreign_key "notifications", "comments"
  add_foreign_key "notifications", "user_profiles"
  add_foreign_key "user_profiles", "users"
end
