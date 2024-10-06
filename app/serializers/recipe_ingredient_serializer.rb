class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :ingredient_id, :quantity

  # Table name: recipe_ingredients
  #
  #  id            :integer          not null, primary key
  #  recipe_id     :integer          not null
  #  ingredient_id :integer          not null
  #  quantity      :text
end
