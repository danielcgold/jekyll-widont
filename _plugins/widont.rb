# Usage
# <h1>{{ page.title | widont }}</h1>

module Jekyll
  module WidontFilter
    def widont(text)
      text.strip!
      text[text.rindex(' '), 1] = '&nbsp;' if text.rindex(' ')
      return text
    end
  end
end

Liquid::Template.register_filter(Jekyll::WidontFilter)
