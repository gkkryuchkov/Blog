module NotificationsHelper

  def new_notifications?()
    if current_user.user_profile.notifications.select{ |x| x.seen == 0 }.any?
      true
    else
      nil
    end
  end

  def class_for_bell
    if new_notifications?
      'text-warning'
    end
  end

end
