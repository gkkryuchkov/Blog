class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  strip_attributes
  has_paper_trail
  include Pundit

end
