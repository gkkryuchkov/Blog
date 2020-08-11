# coding: utf-8
class Article < ApplicationRecord
  belongs_to :user_profile
  belongs_to :section, optional: true
  has_many :comments, as: :commentable
  has_many :notifications
  has_and_belongs_to_many :favorite_users, join_table: 'favorite_articles', class_name: 'UserProfile'


  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :body, presence: true
  #validates :user_profile, presence:true
  has_many_attached :images
  scope :ordering, -> {order(publish_date: :desc)}

  paginates_per 10

  extend FriendlyId
  friendly_id :title, use: :slugged

  before_save :set_slug

  def set_slug
    self.slug = self.title.split.join('_')
  end
end
