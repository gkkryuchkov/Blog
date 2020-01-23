module Auth
  extend ActiveSupport::Concern

  def admin?
    if self
      self.role==1
    else
      false
      end
  end

  def user?
    self.role==0 if self
  end

end
