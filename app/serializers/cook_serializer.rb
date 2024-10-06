class CookSerializer < ActiveModel::Serializer
  #   attributes :id, :name, :email, :created_at, :updated_at
  attributes :name, :email
end
