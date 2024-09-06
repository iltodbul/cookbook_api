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
require "test_helper"

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
