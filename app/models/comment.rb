class Comment < ApplicationRecord
  belongs_to :user_profile
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :usr_com_ratings, dependent: :nullify
  has_many :user_profiles, through: :usr_com_ratings
  has_many :notifications, dependent: :nullify
  validates :user_profile, presence: true
end
