class UsrComRating < ApplicationRecord
  belongs_to :user_profile
  belongs_to :comment

  validate :unique
  def unique
    if UsrComRating.find_by(user_profile_id: self.user_profile_id,
                            comment_id: self.comment_id)
      errors[:base] << 'Only one assertion'
    end
  end
end
