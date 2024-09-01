class ModifyRecipeIngredientsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipe_ingredients, :recipeid, :recipe_id
    rename_column :recipe_ingredients, :ingredientid, :ingredient_id

    add_foreign_key :recipe_ingredients, :recipes, column: :recipe_id, on_delete: :cascade
    add_foreign_key :recipe_ingredients, :ingredients, column: :ingredient_id, on_delete: :cascade

    add_index :recipe_ingredients, :recipe_id
    add_index :recipe_ingredients, :ingredient_id

    remove_column :recipe_ingredients, :trial088, :string
  end
end
