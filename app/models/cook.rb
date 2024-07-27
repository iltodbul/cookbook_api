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