class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :messages
  has_and_belongs_to_many :groups

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end
