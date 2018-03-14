# Jekyll Constant Values

[![Gem](https://img.shields.io/gem/v/jekyll_constant_values.svg)](https://rubygems.org/gems/jekyll_constant_values)

__Jekyll Constant Values__ plugin allows you to render constant values in the `.html` files of your [Jekyll][jekyll-web] project. This way, if you have words that you repeat a lot or words that are susceptible to changes (like the number of workers in your company), this plugin helps you to only have to modify the value in a single file.

## 0. Important notice!

This repository was created with learning porpouses only. You can always create a `constants:` key into your `_config.yml` and then use `site.constants.foo.bar` in the `.html` pages.

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

## 2. Usage

1. Fill your constants YAML file with the content you need:

```yaml
company_name: Group Hirthe-Ritchie
contact:
  phone: (186)285-7925
  address: 282 Kevin Brook
workers: 150
```

2. Use `{% const [key] %}` Jekyll tag to render the content you need in the `.html` files:

```html
<h3>{% const company_name %}</h3>
<p>We are more than {% const workers %} workers in our company located in {% const contact.address %}.</p>
<a href="tel:{% const contact.phone %}">Call us</a>
```

3. After rendering the previous example, you will see the following code in the `.html` file:

```html
<h3>Group Hirthe-Ritchie</h3>
<p>We are more than 150 workers in our company located in 282 Kevin Brook.</p>
<a href="tel:(186)285-7925">Call us</a>
```

## 3. Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## 4. License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[jekyll-web]: https://jekyllrb.com/
