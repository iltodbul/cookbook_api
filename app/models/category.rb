# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime
#  is_deleted :boolean          not null
#  deleted_at :datetime
#  name       :text
#
class Category < ApplicationRecord
  # Relationships
  has_many :recipes

  # Validations
  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :name, length: { maximum: 30 }
  validates :name, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :name, format: { without: /\d/, message: "does not allow numbers" }
  validates :name, format: { without: /\W/, message: "does not allow special characters" }

  # Callbacks
  before_save { self.is_deleted = false }
end
