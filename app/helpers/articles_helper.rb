module ArticlesHelper
  def section_options
    Section.order(:name).to_a.map { |p| [p.name , p.id] }
  end

  def section_name(id)
    Section.find(id).name if id.present?
  end

  def last_five_articles
    Article.ordering.first(5)
  end

end
