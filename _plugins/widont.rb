# Usage
# <h1>{{ page.title | widont }}</h1>

require 'jekyll'
require 'nokogiri'

module Jekyll
  module WidontFilter
    def widont(content)
      doc = Nokogiri::HTML.fragment(content)

      # Stop if we couldn't parse with HTML
      return content unless doc

      tags = ['h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'li', 'p']

      for tag in tags
        doc.css(tag).each do |t|
          t.inner_html = updateTextWithNonBreakingSpace(t.content, tag)
        end
      end

      doc.to_s
    end

    def updateTextWithNonBreakingSpace(text, tag)
      text.strip!

      if tag.include? 'h'
        # don't nbsp long words
        if !text.split.last.nil? && text.split.last.length <= 16
          addNonBreakingSpaceChar(text)
        end
      else
        addNonBreakingSpaceChar(text)
      end

      return text
    end

    def addNonBreakingSpaceChar(text)
      text[text.rindex(' '), 1] = '&nbsp;' if text.rindex(' ')
    end
  end
end

Liquid::Template.register_filter(Jekyll::WidontFilter)
