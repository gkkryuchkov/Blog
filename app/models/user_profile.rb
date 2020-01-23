class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_one_attached :avatar

  validates :user, presence: true
  validates :username, uniqueness: {case_sensitive: false}
end
