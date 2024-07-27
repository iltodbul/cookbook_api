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

ActiveRecord::Schema[7.0].define(version: 2024_07_27_184711) do
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

  create_table "images", id: { type: :string, limit: 450 }, force: :cascade do |t|
    t.datetime "createdon", null: false
    t.datetime "modifiedon"
    t.integer "recipeid", null: false
    t.text "extension"
    t.string "addedbyuserid", limit: 450
    t.text "remoteimageurl"
    t.string "trial006", limit: 1
    t.index ["addedbyuserid"], name: "ix_images_addedbyuserid"
    t.index ["recipeid"], name: "ix_images_recipeid"
  end

  create_table "ingredients", id: :serial, force: :cascade do |t|
    t.datetime "createdon", null: false
    t.datetime "modifiedon"
    t.boolean "isdeleted", null: false
    t.datetime "deletedon"
    t.text "name"
    t.string "trial471", limit: 1
    t.index ["isdeleted"], name: "ix_ingredients_isdeleted"
  end

  create_table "recipeingredients", id: :serial, force: :cascade do |t|
    t.integer "recipeid", null: false
    t.integer "ingredientid", null: false
    t.text "quantity"
    t.string "trial088", limit: 1
    t.index ["ingredientid"], name: "ix_recipeingredients_ingredientid"
    t.index ["recipeid"], name: "ix_recipeingredients_recipeid"
  end

  create_table "recipes", id: :serial, force: :cascade do |t|
    t.datetime "createdon", null: false
    t.datetime "modifiedon"
    t.boolean "isdeleted", null: false
    t.datetime "deletedon"
    t.text "name"
    t.text "instructions"
    t.time "preparationtime", precision: 6, null: false
    t.time "cookingtime", precision: 6, null: false
    t.integer "portionscount", null: false
    t.string "addedbyuserid", limit: 450
    t.integer "categoryid", null: false
    t.text "originalurl"
    t.string "trial150", limit: 1
    t.index ["addedbyuserid"], name: "ix_recipes_addedbyuserid"
    t.index ["categoryid"], name: "ix_recipes_categoryid"
    t.index ["isdeleted"], name: "ix_recipes_isdeleted"
  end

  create_table "users", id: { type: :string, limit: 450 }, force: :cascade do |t|
    t.string "username", limit: 256
    t.string "email", limit: 256
    t.text "password_hash"
    t.text "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at"
    t.boolean "is_deleted", null: false
    t.datetime "deleted_at"
    t.index ["is_deleted"], name: "ix_aspnetusers_isdeleted"
  end

  add_foreign_key "images", "users", column: "addedbyuserid", name: "fk_images_aspnetusers_addedbyuserid"
  add_foreign_key "recipeingredients", "ingredients", column: "ingredientid", name: "fk_recipeingredients_ingredients_ingredientid"
  add_foreign_key "recipes", "categories", column: "categoryid", name: "fk_recipes_categories_categoryid"
  add_foreign_key "recipes", "users", column: "addedbyuserid", name: "fk_recipes_aspnetusers_addedbyuserid"
end
