class UserProfile < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :nullify
  has_and_belongs_to_many :favorite_articles, join_table: 'favorite_articles', class_name: 'Article'
  has_many :comments, dependent: :nullify
  has_one_attached :avatar
  has_many :usr_com_ratings, dependent: :nullify
  has_many :comments, through: :usr_com_ratings

  validates :user, presence: true
  validates :username, uniqueness: {case_sensitive: false}, length: {in: 5..20}

  extend FriendlyId
  friendly_id :username, use: :slugged

  before_commit :set_slug

  def set_slug
    self.slug = self.username.split.join('-')
  end
end
