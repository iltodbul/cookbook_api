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

ActiveRecord::Schema[7.0].define(version: 2024_09_01_174259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.boolean "is_deleted", null: false
    t.datetime "deleted_at"
    t.text "name"
    t.index ["is_deleted"], name: "ix_categories_isdeleted"
  end

  create_table "cooks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_deleted", null: false
    t.datetime "deleted_at"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_deleted"], name: "ix_cooks_is_deleted"
  end

  create_table "images", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.integer "recipe_id", null: false
    t.text "extension"
    t.text "remote_image_url"
    t.uuid "cook_id"
    t.index ["cook_id"], name: "index_images_on_cook_id"
    t.index ["recipe_id"], name: "index_images_on_recipe_id"
  end

  create_table "ingredients", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.boolean "is_deleted", null: false
    t.datetime "deleted_at"
    t.text "name"
    t.index ["is_deleted"], name: "index_ingredients_on_is_deleted"
  end

  create_table "recipe_ingredients", id: :serial, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "ingredient_id", null: false
    t.text "quantity"
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.boolean "is_deleted", null: false
    t.datetime "deleted_at"
    t.text "name"
    t.text "instructions"
    t.time "preparation_time", precision: 6, null: false
    t.time "cooking_time", precision: 6, null: false
    t.integer "portions_count", null: false
    t.integer "category_id", null: false
    t.text "original_url"
    t.uuid "cook_id"
    t.index ["category_id"], name: "index_recipes_on_category_id"
    t.index ["cook_id"], name: "index_recipes_on_cook_id"
    t.index ["is_deleted"], name: "index_recipes_on_is_deleted"
  end

  add_foreign_key "images", "cooks", on_delete: :nullify
  add_foreign_key "images", "recipes", on_delete: :cascade
  add_foreign_key "recipe_ingredients", "ingredients", on_delete: :cascade
  add_foreign_key "recipe_ingredients", "recipes", on_delete: :cascade
  add_foreign_key "recipes", "categories"
  add_foreign_key "recipes", "cooks", on_delete: :nullify
end
