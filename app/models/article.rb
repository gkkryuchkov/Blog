class Article < ApplicationRecord
  belongs_to :user_profile
  belongs_to :section, optional:true
  has_many :comments, dependent: :delete_all
  #validates :user_profile, presence:true

  scope :ordering, -> {order(publish_date: :desc)}

  paginates_per 5
end
