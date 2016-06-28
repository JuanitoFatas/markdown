require "html/pipeline/jolly_good_code/nohtml_markdown_filter"

class RenderMarkdown
  def initialize(content)
    @content = content
  end

  def call(**options)
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::JollyGoodCode::NohtmlMarkdownFilter,
      HTML::Pipeline::SanitizationFilter,
      HTML::Pipeline::RougeFilter,
    ], { gfm: true, **options }

    pipeline.call(content)[:output].to_s.html_safe
  end

  private

    attr_reader :content
end
