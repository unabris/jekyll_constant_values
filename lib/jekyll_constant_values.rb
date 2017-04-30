require 'jekyll_constant_values/version'

module Jekyll
  class ConstantValues < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end
end

Liquid::Template.register_tag('const', Jekyll::ConstantValues)
