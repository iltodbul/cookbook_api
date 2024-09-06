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
end
