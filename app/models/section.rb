class Section < ApplicationRecord
  has_many :articles, dependent: :nullify
end
