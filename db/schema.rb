# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_10_023001) do

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.integer "pet_id"
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "requestor_id", null: false
    t.integer "requestee_id", null: false
    t.boolean "has_friended", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requestee_id"], name: "index_friends_on_requestee_id"
    t.index ["requestor_id", "requestee_id"], name: "index_friends_on_requestor_id_and_requestee_id", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "pet_id", null: false
    t.string "likeable_type"
    t.integer "likeable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["pet_id", "likeable_type", "likeable_id"], name: "index_likes_on_pet_id_and_likeable_type_and_likeable_id", unique: true
  end

  create_table "pets", force: :cascade do |t|
    t.string "name", null: false
    t.string "tagline"
    t.string "password_digest", null: false
    t.string "session_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_pets_on_name", unique: true
    t.index ["session_token"], name: "index_pets_on_session_token", unique: true
  end

  create_table "photos", force: :cascade do |t|
    t.integer "pet_id", null: false
    t.string "photo_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "profile_photo", default: false
    t.index ["pet_id"], name: "index_photos_on_pet_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "pet_id", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_posts_on_pet_id"
  end

end
