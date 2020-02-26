class Comment < ApplicationRecord
  belongs_to :user_profile
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :user_profile, presence: true

end
