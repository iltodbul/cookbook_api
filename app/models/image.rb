# == Schema Information
#
# Table name: images
#
#  created_at       :datetime         not null
#  updated_at       :datetime
#  recipe_id        :integer          not null
#  extension        :text
#  remote_image_url :text
#  id               :uuid             not null, primary key
#  cook_id          :uuid
#
class Image < ApplicationRecord
  # Relationships
  belongs_to :recipe
  belongs_to :cook, optional: true

  # Validations
  validates :recipe_id, presence: true
  validates :cook_id, presence: true
end
