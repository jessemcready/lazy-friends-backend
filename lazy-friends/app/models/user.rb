class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true
  validates :password, length: { minimum: 6 }

  validates :location, presence: true

  validates :name, presence: true
end
