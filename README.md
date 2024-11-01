# jekyll-98

[***See it in action right here!***](https://queenkjuul.github.io/jekyll-98/)

A theme for Jekyll built using the [XP.css](https://github.com/botoxparty/XP.css) fork of [98.css](https://github.com/jdan/98.css) which aims to recreate the aesthetics of Windows 98 in a mobile-friendly, customizable blog format.

*Almost* no JavaScript, but should be perfectly usable without. Ships with pagination, atom feed generation, automatic social media links, and per-category index pages out of the box.

![screenshot of jekyll-98](https://raw.githubusercontent.com/queenkjuul/jekyll-98/main/assets/screenshot.png)

## Installation

### Quick Start

This repo is actually a fully functional jekyll site! You can clone or fork this repo, update the config with your own values, add some posts, et voila! You have a website ready to be hosted with Github Pages or built and served on your own host.

If you use this repo as a base, make sure your GitHub Repo > Settings > Pages > Source is set to "GitHub Actions." The `main` branch is deployed by default. Edit `.github/workflows/jekyll.yml` to change branches. [See note below about GitHub Actions](#github-pages--jekyll-remote-theme)

```sh
git clone https://github.com/queenkjuul/jekyll-98
cd jekyll-98
bundle
bundle exec jekyll serve  # preview
bundle exec jekyll build  # build
```

### GitHub Pages / jekyll-remote-theme

In your site's _config.yml, add:

```yml
remote_theme: queenkjuul/jekyll-98
```

You will need a `_config.yml` file in the root of your deployment branch as well. All it needs to contain is:

```yaml
defaults:
  - scope:
      path: "" # an empty string here means all files in the project
    values:
      layout: "post"
```

Without this, your README.md file will not use any particular layout, and will just render plain text onto an empty desktop. For a more complete example, see [here](https://github.com/queenkjuul/spotify97/blob/main/_config.yml)

If you are not adding your own social media links to `_config.yml` then you will also need to add this:

```yaml
jekyll-98:
  social_links:
    github: false
    youtube: false
    twitch: false
```

Otherwise, my own socials will appear on your site :cringe: (if anyone knows a better way to override these by default let me know)

#### GitHub Pages Deployment

**NOTE:** the "deploy from branch (classic)" GitHub Pages deployment method FAILS to generate category index pages. However, the default Jekyll GitHub Action works. [See instructions from GitHub here and set up your site's repo to publish with the default Jekyll workflow](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-with-a-custom-github-actions-workflow). 

Using the legacy "deploy from branch" option will not break the site, but it will break the [`desktop_categories`](#theme-settings) and [`show_categories`](#settings) functions. If they are left enabled, the site will build and deploy, but those links will lead to 404s, so it's best to disable them.

### Manual installation

`jekyll-98` is now available as a standard `gem` theme. You can install it to your site with `bundle add jekyll-98` and add this line to your Jekyll site's `_config.yml`:

```yaml
theme: jekyll-98
```

## Usage

Theme should provide sane defaults, but there's lots to customize. For full configuration options, refer to [_config.yml](https://github.com/queenkjuul/jekyll-98/blob/main/_config.yml). Add whatever settings you want *to your site's _config.yml*.

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
  - `categories: string1 string2 ...` - space-separated list of post categories. Posts can be browsed by category with links on the homepage. Uses [jekyll-category-pages](https://github.com/field-theory/jekyll-category-pages).
  - `icon: icon_string` - `icon_string` is the filename of any icon in the jekyll-98 `assets/icons` folder, minus the extension (so omit `.png`). Optional. Unfortunately for now, can't be automatically set by category. Will appear in any post list.
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
show_excerpts:  false       # show post excerpts in post lists
show_categories:  true     # show category links in post lists - REQUIRES GITHUB ACTIONS TO WORK WITH GITHUB PAGES, SEE README
paginate:       3           # set to false to disable, numbers above 3 might be weird on mobile
paginate_path:  /page/:num  # change if you know what you're doing
google_analytics: asdf1234  # your google analytics key
```

Enabling excerpts will show the first bit of a post on the home page. This can be a little unreliable with the layout of the posts list, so either disable (default) or experiment. You can define an explicit excerpt (instead of letting Jekyll guess) by defining `excerpt` in the post's front matter (see [Posts](#posts))

`show_categories` is NOT compatible with the default "deploy from a branch" GitHub Pages deployment method. Instead, [use a GitHub Action](#github-pages-deployment)

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

Not compatible with the default "Deploy from a branch" GitHub Pages deployment method. [Use the default Jekyll deployment Action instead](#github-pages-deployment)

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

All available sites/icons are listed in the theme [`_config.yml`](https://github.com/queenkjuul/jekyll-98/blob/main/_config.yml). Define a username, and the site will appear in the taskbar, as well as the Contact page (if enabled)

#### `contact`

By default, the contact page will display the name and email set in the site config. Commenting/removing these lines will prevent the Contact page from being generated (and links to it will be removed)

See [`_config.yml`](https://github.com/queenkjuul/jekyll-98/blob/main/_config.yml) for details on setting up additional info beyond name + email.

#### `about`

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