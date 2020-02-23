class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :nullify
  has_and_belongs_to_many :favorite_articles, join_table: 'favorite_articles', class_name: 'Article'
  has_many :comments, dependent: :nullify
  has_one_attached :avatar

  validates :user, presence: true
  validates :username, uniqueness: {case_sensitive: false}, length: {in: 5..20}
end
