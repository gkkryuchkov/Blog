class SectionPolicy < ApplicationPolicy
  def create?
    user.try(:admin?)
  end
  def update?
    user.try(:admin?)
  end
  def edit?
    user.try(:admin?)
  end
  def destroy?
    user.try(:admin?)
  end
end
