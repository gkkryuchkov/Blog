module ArticlesHelper
  def section_options
    Section.order(:name).to_a.map { |p| [p.name , p.id] }
  end
end
