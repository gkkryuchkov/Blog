class Section < ApplicationRecord
  has_many :articles, dependent: :nullify

  def section_name
    "#{name}"
  end

end
