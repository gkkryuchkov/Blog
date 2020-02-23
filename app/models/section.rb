class Section < ApplicationRecord
  has_many :articles, dependent: :nullify
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  def section_name
    "#{name}"
  end

end
