class RenameRecipeingredientsToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipeingredients, :recipe_ingredients
  end
end
