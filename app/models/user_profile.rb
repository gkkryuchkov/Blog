class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :nullify
  has_many :comments, dependent: :nullify
  validates :user, presence: true
end
