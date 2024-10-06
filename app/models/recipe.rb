# == Schema Information
#
# Table name: recipes
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime
#  is_deleted       :boolean          not null
#  deleted_at       :datetime
#  name             :text
#  instructions     :text
#  preparation_time :time             not null
#  cooking_time     :time             not null
#  portions_count   :integer          not null
#  category_id      :integer          not null
#  original_url     :text
#  cook_id          :uuid
#
class Recipe < ApplicationRecord
  # Relationships
  belongs_to :cook
  belongs_to :category
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :images

  # Validations
  validates :name, presence: true
  validates :instructions, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :portions_count, presence: true
  validates :category_id, presence: true
  validates :cook_id, presence: true

  # Callbacks
  before_save { self.is_deleted = false }
end
