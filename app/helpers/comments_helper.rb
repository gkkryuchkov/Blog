module CommentsHelper

  def add_comment_link(f, article_id)
    new_comment = Comment.new(article_id: article_id, user_profile_id: current_user.id)
    html = f.fields_for :comment, new_comment, child_index: :new_comment do |cm|
      render 'comments/form', :cm => cm
    end
      name=I18n.t('comments.new')
      link_to name, "#", "data-partial" => h(html), class: "btn btn-outline-secondary btn-sm add_role"
  end

  def has_change_rights(comment)
    if comment.user_profile == current_user.user_profile || current_user.try(:admin?)
      true
    else
      false
    end
  end

  def choose_rating_color(rating)
    return unless rating

    if rating > 0
      '.text-success'
    elsif rating < 0
      '.text-danger'
    else
      nil
    end
  end

end
