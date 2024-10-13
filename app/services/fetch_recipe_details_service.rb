class FetchRecipeDetailsService
  def initialize(recipe_id)
    @recipe_id = recipe_id
  end

  def call
    recipe = Recipe.find(@recipe_id)
    return nil if recipe.is_deleted || recipe.nil?
    recipe_details = {
      id: recipe.id,
      name: recipe.name,
      created: recipe.updated_at || recipe.created_at,
      instructions: recipe.instructions,
      preparation_time: recipe.preparation_time,
      cooking_time: recipe.cooking_time.to_s,
      portions_count: recipe.portions_count,
      category: recipe.category.name,
      images: recipe.images.map { |image| image.remote_image_url },
      cook_id: recipe.cook.id,
      cook_name: recipe.cook.name,
      recipe_ingredients: recipe.recipe_ingredients.map { |recipe_ingredient|
        {
          ingredient_id: recipe_ingredient.ingredient.id,
          ingredient: recipe_ingredient.ingredient.name,
          quantity: recipe_ingredient.quantity,
        }
      },
    }
    recipe_details
  end
end
