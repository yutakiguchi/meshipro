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

ActiveRecord::Schema.define(version: 2021_06_10_140116) do

  create_table "cocks", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_cocks_on_email", unique: true
    t.index ["reset_password_token"], name: "index_cocks_on_reset_password_token", unique: true
  end

  create_table "controllers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "users"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_controllers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_controllers_on_reset_password_token", unique: true
  end

  create_table "my_recipes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_my_recipes_on_recipe_id"
    t.index ["user_id"], name: "index_my_recipes_on_user_id"
  end

  create_table "my_restaurants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_my_restaurants_on_restaurant_id"
    t.index ["user_id"], name: "index_my_restaurants_on_user_id"
  end

  create_table "recipe_comments", force: :cascade do |t|
    t.text "text", null: false
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_comments_on_recipe_id"
    t.index ["user_id"], name: "index_recipe_comments_on_user_id"
  end

  create_table "recipe_images", force: :cascade do |t|
    t.integer "recipe_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "cock_id"
    t.string "name"
    t.text "explanation"
    t.text "material"
    t.text "cook_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_comments", force: :cascade do |t|
    t.text "text", null: false
    t.integer "user_id", null: false
    t.integer "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_comments_on_restaurant_id"
    t.index ["user_id"], name: "index_restaurant_comments_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer "cock_id"
    t.string "name"
    t.string "image_id"
    t.text "description"
    t.integer "post_code"
    t.integer "prefecture_code"
    t.string "address_street"
    t.string "address_city"
    t.string "address_building"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
