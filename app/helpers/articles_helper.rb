module ArticlesHelper
  def section_options
    Section.order(:name).to_a.map { |p| [p.name , p.id] }
  end

  def section_name(id)
    Section.find(id).name if id.present?
  end

  def last_five_articles(_article_id=nil)
    articles = if _article_id
                 Article.ordering.where('id != ?', _article_id)
               else
                 Article.ordering
               end
    articles = articles.where(hidden: 0)
    if current_user
      (articles - current_user.user_profile.favorite_articles).first(5)
    else
      articles.first(5)
    end
  end

  def add_art_comment_link(article)
    new_comment = Comment.new()
    html = render 'comments/article_comment'
    name = I18n.t('helpers.new') + ' ' + I18n.t('articles.comment').downcase
    link_to name, '#', 'data-partial' => h(html),
                       class: 'btn btn-sm btn-outline-secondary add_art_comment'
  end
  def add_com_comment_link(comment, comment_id)
    new_comment = Comment.new()
    html = render partial: 'comments/com_comment', object: comment
    name = I18n.t('comments.reply')
    link_to name, '#', 'data-partial' => h(html),
                       class: 'btn btn-sm mx-1 btn-outline-secondary add_com_comment'
  end

  def image_paste(url)
    "<div style=\"text-align:center\">
      <img src=\"#{url}\" width=20%>
    </div>"
  end
end
