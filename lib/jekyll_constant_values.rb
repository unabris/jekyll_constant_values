require 'jekyll_constant_values/version'

module Jekyll
  class Site
    def process
      # Get the constants file path
      const_file = constants_file_path
      # Exit the process if not valid file
      exit unless valid_file?(const_file)
      puts "Using file #{const_file} for constant values"
    end

    def constants_file_path
      # Check if a new name for constants file is defined
      if config['constants'].nil?
        '_data/constants.yml' # Default constants file
      else
        '_data/' + config['constants'] + '.yml' # New constants file
      end
    end

    def valid_file?(const_file)
      # Check if the constants file exist
      unless File.exist?(const_file)
        puts "No such file or directory #{const_file}"
        return false
      end
      true
    end
  end

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
