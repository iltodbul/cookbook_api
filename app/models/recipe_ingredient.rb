# == Schema Information
#
# Table name: recipe_ingredients
#
#  id            :integer          not null, primary key
#  recipe_id     :integer          not null
#  ingredient_id :integer          not null
#  quantity      :text
#
class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, presence: true
  validates :ingredient_id, presence: true
  validates :recipe_id, presence: true
  validates :quantity, numericality: { greater_than: 0 }

  # def ingredient_name
  #     ingredient.name
  # end

  # def ingredient_name=(name)
  #     self.ingredient = Ingredient.find_or_create_by(name: name)
  # end
end
