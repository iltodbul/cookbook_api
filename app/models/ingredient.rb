# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime
#  is_deleted :boolean          not null
#  deleted_at :datetime
#  name       :text
#
class Ingredient < ApplicationRecord
  # Relationships
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  # Validations
  validates :name, presence: true
  #   validates :name, uniqueness: true #???
  validates :name, length: { minimum: 3 }
  validates :name, length: { maximum: 30 }
  validates :name, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :name, format: { without: /\d/, message: "does not allow numbers" }
  validates :name, format: { without: /\W/, message: "does not allow special characters" }

  # Callbacks
  before_save { self.is_deleted = false }
end
