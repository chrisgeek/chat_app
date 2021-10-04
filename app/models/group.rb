class Group < ApplicationRecord
  resourcify
  has_and_belongs_to_many :users
  has_many :messages

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
end
