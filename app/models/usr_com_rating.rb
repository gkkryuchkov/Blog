class UsrComRating < ApplicationRecord
  belongs_to :user_profile
  belongs_to :comment

  validate :unique
  validate :self_comment

  def self_comment
    if self.user_profile_id == Comment.find(self.comment_id).user_profile_id
      errors[:base] << 'Only one assertion'
    end
  end

  def unique
    if UsrComRating.find_by(user_profile_id: self.user_profile_id,
                            comment_id: self.comment_id)
      errors[:base] << 'You could not rate your own comments'
    end
  end
end
