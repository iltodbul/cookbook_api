# == Schema Information
#
# Table name: cooks
#
#  id              :uuid             not null, primary key
#  name            :string           not null
#  is_deleted      :boolean          not null
#  deleted_at      :datetime
#  email           :string           not null
#  password_digest :string           not null
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class CookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
