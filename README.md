# jekyll-98

A theme for Jekyll built using the [XP.css](https://github.com/botoxparty/XP.css) fork of [98.css](https://github.com/jdan/98.css) which aims to recreate the aesthetics of Windows 98 in a usable, customizable blog format. 

The goal was to avoid JavaScript, and there is only one line of javascript in the theme. if you can tell me how to get rid of it, please do. 

## Installation

in your blog root folder, create a directory `_theme`

`cd` into `_theme` and clone this repo into it

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-98", :path => "_themes"
```

And add this line to your Jekyll site's `_config.yml`:

```yaml
theme: jekyll-98
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-98

## Usage

TODO: Write usage instructions here. Describe your available layouts, includes, sass and/or assets.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/queenkjuul/hello. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development

To set up your environment to develop this theme, run `bundle install`.

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

When your theme is released, only the files in `_layouts`, `_includes`, `_sass` and `assets` tracked with Git will be bundled.
To add a custom directory to your theme-gem, please edit the regexp in `jekyll-98.gemspec` accordingly.

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


<!-- some work from minima
social icons from https://github.com/edent/SuperTinyIcons
credit Alex Meub https://win98icons.alexmeub.com/
create license page -->