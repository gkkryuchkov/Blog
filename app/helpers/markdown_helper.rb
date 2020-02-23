module MarkdownHelper
  def markdown(md)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, tables: true, autolink: true, space_after_headers: true, quote: true, highlights: true).render(md)
  end
end