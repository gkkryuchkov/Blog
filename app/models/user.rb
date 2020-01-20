class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one :user_profile, dependent: :destroy
  after_commit :check_user_profile
  def check_user_profile
    if user_signed_in?
      if current_user.user_profile.nil?
        redirect_to new_user_profile_path
      end
    end
  end
end
