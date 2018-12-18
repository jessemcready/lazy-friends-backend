class User < ApplicationRecord
  has_secure_password

  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :username, presence: true
  validates :username, uniqueness: true
  # validates :username, length: { in: 6..15 }

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true
  validates :password, length: { in: 6..15 }

  validates :location, presence: true

  validates :name, presence: true
  # validates :name, length: { in: 3..25 }
end
