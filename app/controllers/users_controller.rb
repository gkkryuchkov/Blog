class UsersController < ApplicationController
  after_create :create_user_profile
  def create_user_profile
    if current_user && current_user.user_profie.nil?
      current_user.user_profile = UserProfile.new(username: current_user.email, user_id: current_user.id)
    end
  end
end