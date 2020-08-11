module SearchHelper
  def search_options
    Section.order(:name).to_a.map { |p| [p.name , link_to(section_path(p.id))]}+
    Article.order(:title, :description).to_a.map { |p| [p.title+' '+p.try(:description), link_to(article_path(p.id))]}
  end
end