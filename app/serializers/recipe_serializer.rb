class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :images_url, :preparation_time, :cooking_time, :portions_count, :category_id, :original_url, :cook_id, :created_at, :updated_at

  belongs_to :cook, serializer: CookSerializer
  belongs_to :category, serializer: CategorySerializer
  has_many :recipe_ingredients, serializer: RecipeIngredientSerializer
  has_many :ingredients, serializer: IngredientSerializer
  has_many :images, serializer: ImageSerializer

  def images_url
    self.object.images.map { |image| image.remote_image_url }
  end

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

  # Relationships
  #   belongs_to :cook
  #   belongs_to :category
  #   has_many :recipe_ingredients
  #   has_many :ingredients, through: :recipe_ingredients
  #   has_many :images

end
