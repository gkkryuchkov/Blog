class Comment < ApplicationRecord
  belongs_to :user_profile
  belongs_to :article

  validates :article, :user_profile, presence: true
end
