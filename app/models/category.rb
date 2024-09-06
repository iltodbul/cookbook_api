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
end
