class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :location, :coordinates, :username, :profile_url, :groups

  # has_many :groups, each_serializer: GroupSerializer
  has_many :user_groups
  has_many :groups, through: :user_groups
end
