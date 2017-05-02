# Jekyll Constant Values

Jekyll plugin to render constant values

## 1. Installation

1. Add the following to your site's Gemfile:

```ruby
gem 'jekyll_constant_values', group: :jekyll_plugins
```

2. Run `bundle install` in your command line:

```bash
$ bundle install
```

3. Create a new YAML file called `constants.yml` under your `_data/` folder. If you prefer, you can customize the name of the file (must be also under `_data/`) and put the name of your custom file without the extension in your `_config.yml` file this way:

```yaml
constants: your-custom-name
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
