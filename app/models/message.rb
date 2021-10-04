class Message < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :group, optional: true

  validates :body, presence: true
end
