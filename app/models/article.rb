class Article < ApplicationRecord
  belongs_to :user_profile
  belongs_to :section, optional:true
  has_many :comments, dependent: :delete_all
  has_and_belongs_to_many :favorite_users, join_table: 'favorite_articles', class_name: 'UserProfile'

  accepts_nested_attributes_for :comments#TODO: доделать
  #validates :user_profile, presence:true
  has_many_attached :images
  scope :ordering, -> {order(publish_date: :desc)}

  paginates_per 10



end
