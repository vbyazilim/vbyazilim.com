Time.zone = "Europe/Istanbul"

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

set :css_dir,    'public/css'
set :js_dir,     'public/js'
set :images_dir, 'public/images'

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, {
  fenced_code_blocks: true,
  smartypants: true,
  tables: true,
  autolink: true,
  strikethrough: true,
  superscript: true,
  underline: true,
  highlight: true,
  footnotes: true,
}

proxy "/posts/index.html", "/pages/articles.html", :ignore => true
proxy "/services/index.html", "/pages/services.html"
proxy "/training/index.html", "/pages/training.html"

activate :blog do |blog|
  blog.custom_collections = {
      category: {
        link: 'posts/category/{category}.html',
        template: 'templates/category.html'
      }
  }

  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # blog.summary_length = 250
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.sources = "posts/{year}-{month}-{day}-{title}.html"
  blog.layout = "blog_detail_layout"
  blog.tag_template = "templates/tag.html"
  blog.calendar_template = "templates/calendar.html"
  blog.summary_separator = /READ_MORE/
  blog.permalink = "posts/{year}/{month}/{day}/{title}.html"
  blog.taglink = "posts/tag/{tag}/index.html"
  blog.year_link = "posts/year/{year}.html"
  blog.paginate = true
  blog.page_link = "page/{num}"
end
activate :directory_indexes

page "/feed.xml", layout: false


configure :development do
  activate :livereload, host: '127.0.0.1'
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end
