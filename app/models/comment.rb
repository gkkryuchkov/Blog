class Comment < ApplicationRecord
  belongs_to :user_profile
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :answers_comments, class_name: 'Comment', foreign_key: 'parent_comment_id'
  belongs_to :parent_comment, class_name: "Comment", optional: true
  validates :article, :user_profile, presence: true
end
