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
class Cook < ApplicationRecord
  has_secure_password
  # has_many :recipes
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate(email, password)
    cook = Cook.find_by(email: email)
    cook && cook.authenticate(password)
  end
end

#Cook.create(name: "Cook3", is_deleted: false, email: "adc@test.it", password: "hashPass3")
