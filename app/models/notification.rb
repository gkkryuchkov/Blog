class Notification < ApplicationRecord
  belongs_to :article
  belongs_to :comment
  belongs_to :user_profile
   
end
