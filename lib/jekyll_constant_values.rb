require 'jekyll_constant_values/version'

module Jekyll
  class Site
    attr_accessor :constants_file
    alias :process_constants :process

    def process
      # Get the constants file path
      const_file = constants_file_path
      # Exit the process if not valid file
      exit unless valid_file?(const_file)
      # Assign the path if valid
      self.constants_file ||= const_file
      # Show info message
      puts "Using file #{const_file} for constant values"

      process_constants
    end

    def constants_file_path
      # Check if a custom name for constants file is defined
      if config['constants'].nil?
        '_data/constants.yml' # Default constants file
      else
        '_data/' + config['constants'] + '.yml' # Custom constants file
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
    def initialize(tag_name, key, tokens)
      super
      @key = key.strip
    end

    def render(context)
      # Load Jekyll site object
      site = context.registers[:site]
      # Load constants file
      c_file = YAML.load_file(site.constants_file)
      # Get constant value
      c_value = @key.to_s.split('.').inject(c_file) { |h, k| h[k.to_s] }
      # Check if constant value is empty
      if c_value.nil?
        # Get the path of the file where is failing
        page_path = context.registers[:page]['path']
        # Show info message
        puts "No constant value for key '#{@key}' in file '#{page_path}'"
      end
      # Return the constant value
      c_value
    end
  end
end

Liquid::Template.register_tag('const', Jekyll::ConstantValues)
