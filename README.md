# jekyll-98

A theme for Jekyll built using the [XP.css](https://github.com/botoxparty/XP.css) fork of [98.css](https://github.com/jdan/98.css) which aims to recreate the aesthetics of Windows 98 in a usable, customizable blog format.

*Almost* no JavaScript, but should work basically perfectly without. Easily extensible by reusing the provided `includes`. Easily customizable without extension.

## Installation

*WIP - Should be packaged as a gem soon*

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

### Static pages

As far as I can tell, I can't generate extra pages within the theme and have them appear in the root of your website. Thus, extra generated pages, like the 404, About, and Contact pages, need to be manually added to your site. Simply copy whichever pages you wish to include in your site out of the `_pages` folder of this repo and into the root of your own repo. If you don't do this with 404.md, you will get a default 404 page, see below

#### 404.md

- **If you're using GitHub Pages and a *.github.io domain:**
  - Ignore this, github.io pages *always* use the GitHub 404
- **If you're self-hosting or using a GitHub Pages Custom Domain:**
  - You will need to copy 404.md into the root of your site repo or else you will only get your server's standard 404 page

#### contact.html

Page will list author name and email as defined in the top level of your site's `_config.yml` (`site.author.email, site.author.name`), as well as any additional contact fields you wish to define in `jekyll-98.contact`, see [contact](#contact). 

#### about.html

Page will list authorship information and links for the theme, as well as your site's title and description, plus any additional fields you define in `jekyll-98.about`, see [about](#about).

## Usage

Theme should provide sane defaults, but there's lots to customize. For full configuration options, refer to [_config.yml](https://github.com/queenkjuul/jekyll-98/blob/master/_config.yml). Add whatever settings you want *to your site's _config.yml*.

### Posts

#### Titles and excerpts

The default Post layout includes a header containing the post title as defined in the front matter. This means that if the first line of your post is a header containing the title, the title will appear twice. Keep this in mind. Also, Jekyll will by default use the first block of your post as its excerpt, so it's best to avoid first-line headers. You can always define an excerpt explicitly in the front matter like so:

```yml
---
title: Post Title
excerpt: this is what will show on the home page (if show_excerpts is enabled)
---
```

#### List formatting

If you add `{:.tree-view}` before your bulleted lists, they will render in Windows Explorer-style tree view mode. I'd like to do this automatically, but I don't know how to apply a class automatically to the kramdown/jekyll output. If you know how, get in touch! Open an issue, raise a PR, or (please don't really) email me.

Example:
```md
{:.tree-view}
 - First Item
    - Second Item
 - Third Item
```

{:.tree-view}
- First Item
  - Second Item
- Third Item

#### Front matter

You will want to define the following in your posts' front matter:

- Required:
  - `title: string` - as mentioned above, will be displayed as a top-level header in the post page layout, as well as in lists
  - `layout: post` - you probably want to leave this
  - `date: YYYY-MM-DD HH:MM:SS +/-0000` - time zone offset at end. Only for internal use, actual formatted date shown to users is formatted per `jekyll-98.date_format` in `_config.yml`
- Optional
  - `categories: string1 string2 ...` - space-separated list of post categories. Posts can be browsed by category with links on the homepage
  - `icon: icon_string` - `icon_string` is the filename of any icon in the jekyll-98 `assets/icons` folder, minus the extension (so omit `.png`). Optional. Unfortunately for now, can't be automatically set by category. Will appear in any post list (homepage, /posts, /categories)
  - `excerpt: string` - excerpt to be shown in post lists if excerpts is enabled in `_config.yml`. If not defined, jekyll will use the first paragraph of your post.

## Configuration

### Basic site info

```yaml
title: blog name
author:     # ***PUBLIC BY DEFAULT!***
    name: &name your name           # need &name prefix for Contact page to work
    email: &email your@email.com    # need &email prefix for Contact page
description: what's the deal with websites?
```

Basic Jekyll/Pages info from the template, such as title, author, and description. Author is a parent node, with child nodes name and email. Site title is used everywhere. Description appears on Home and About pages. Author info only shows up (optionally) on the Contact page. `title`, `author`, and `description` should be defined at the root level of your `_config.yml`

### Settings

```yaml
show_excerpts:  false
paginate:       3           # set to false to disable, numbers above 3 might be weird on mobile
paginate_path:  /page/:num  # change if you know what you're doing
google_analytics: asdf1234  # your google analytics key
```

Enabling excerpts will show the first bit of a post on the home page. This can be a little unreliable with the layout of the posts list, so either disable (default) or experiment. You can define an explicit excerpt (instead of letting Jekyll guess) by defining `excerpt` in the post's front matter (see [Posts](#posts))

### Theme settings

Theme settings are defined within the `jekyll-98` node of your _config.yml

```yaml
title: ...
author: ...
...
jekyll-98:
    date_format: ...
    ...
```

#### `date_format`

change how timestamps are shown - refer to [https://shopify.github.io/liquid/filters/date/](https://shopify.github.io/liquid/filters/date/) if you want to customize this

#### `icon`

you can define a different icon to use for the "my computer" homepage icon on the desktop here.

#### `desktop_categories`

Categories defined in this array will generate desktop icons and start menu links, assuming there are posts that exist that are tagged with that category. Note that things might get weird layout wise if you have more than 5-7 desktop icons total (`desktop_categories` and `site_links` combined)

#### `site_links`

You can define additional links to include on the desktop and start menu. Links must have a title, url, icon, and alt text/description. the `alt` text is both the alt-text for the actual icon image tag (for screen readers) but also appears in the start menu. The start menu does not wrap text, so long descriptions might stretch the menu out to goofy proportions.

```yml
jekyll-98:
    site_links:
        - title: 'Name'
          url: https://example.com
          icon: document    # see assets/icons
          alt: 'Descriptive text'
```

#### `social_links`

All available sites/icons are listed in the theme [`_config.yml`](https://github.com/queenkjuul/jekyll-98/blob/master/_config.yml). Define a username, and the site will appear in the taskbar, as well as the Contact page (if enabled)

#### `contact`

To use the contact page, you must copy the `_pages/contact.html` file into your site's root. 

By default, the contact page will display the name and email set in the site config. Commenting/removing these lines will prevent the Contact page from being generated (and links to it will be removed)

See [`_config.yml`](https://github.com/queenkjuul/jekyll-98/blob/master/_config.yml) for details on setting up additional info beyond name + email.

#### `about`

To use the About page, you must copy the `_pages/about.html` file into your site's root.

You can add any info you like to the default About page. The About page will automatically include your site description. Additional lines defined in the `jekyll-98.about` array will appear in a bulleted list on the About page, below the description.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/queenkjuul/jekyll-98. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development

To set up your environment to develop this theme, run `bundle install`.

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

When your theme is released, only the files in `_layouts`, `_includes`, `_sass` and `assets` tracked with Git will be bundled.
To add a custom directory to your theme-gem, please edit the regexp in `jekyll-98.gemspec` accordingly.

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


social icons from https://github.com/edent/SuperTinyIcons

credit Alex Meub https://win98icons.alexmeub.com/