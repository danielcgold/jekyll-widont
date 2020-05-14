# A widont plugin for Jekyll

Originally from https://github.com/scottboms/jekyll-widont.

## Installation

Add in the `_plugins` directory in your Jekyll site. `bundle exec jekyll serve` to use!

## Usage

The plugin works like any other standard Liquid filters. Simply pass the text you want to process through the widont keyword using a pipe character.

    <h1>{{ page.title | widont }}</h1>
