class ImageSerializer < ActiveModel::Serializer
  attributes :id, :remote_image_url, :recipe_id, :cook_id, :created_at, :updated_at

  # Table name: images
  #
  #  created_at       :datetime         not null
  #  updated_at       :datetime
  #  recipe_id        :integer          not null
  #  extension        :text
  #  remote_image_url :text
  #  id               :uuid             not null, primary key
  #  cook_id          :uuid
end
