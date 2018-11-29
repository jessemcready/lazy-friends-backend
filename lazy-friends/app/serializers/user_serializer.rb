class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :location, :coordinates, :username, :profile_url, :password_digest

  has_many :groups
end
