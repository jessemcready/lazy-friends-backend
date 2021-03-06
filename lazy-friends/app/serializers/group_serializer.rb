class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :suggestions, :description, :users, :created_at, :updated_at

  # has_many :users, each_serializer: UserSerializer
  has_many :user_groups
  has_many :users, through: :user_groups
end
