module CommentsHelper

  def add_comment_link(f, article_id)
    new_comment = Comment.new(article_id: article_id, user_profile_id: current_user.id)
    html = f.fields_for :comment, new_comment, child_index: :new_comment do |cm|
      render 'comments/form', :cm => cm
    end
      name=I18n.t('comments.new')
      link_to name, "#", "data-partial" => h(html), class: "btn btn-outline-secondary btn-sm add_role"
  end

end
