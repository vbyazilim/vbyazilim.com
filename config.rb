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

proxy '/blog/index.html', '/pages/articles.html'
proxy '/services/index.html', '/pages/services.html'
proxy '/training/index.html', '/pages/training.html'

proxy '/tr/index.html', '/pages/tr/index.html'
proxy '/tr/servisler/index.html', '/pages/tr/services.html'
proxy '/tr/egitimler/index.html', '/pages/tr/training.html'
proxy '/tr/e-dukkan/index.html', '/pages/tr/store.html'
proxy '/tr/e-dukkan/kullanim-sartlari/index.html', '/pages/tr/store/terms.html'
proxy '/tr/e-dukkan/geri-odeme-politikasi/index.html', '/pages/tr/store/refund.html'
proxy '/tr/e-dukkan/gizlilik-politikasi/index.html', '/pages/tr/store/privacy.html'

activate :blog do |blog|
  blog.custom_collections = {
      category: {
        link: 'blog/category/{category}.html',
        template: 'templates/category.html'
      }
  }
  blog.sources = "blog/{year}-{month}-{day}-{title}.html"
  blog.layout = "blog_detail_layout"
  blog.tag_template = "templates/tag.html"
  blog.calendar_template = "templates/calendar.html"
  blog.summary_separator = /READ_MORE/
  blog.permalink = "blog/{year}/{month}/{day}/{title}.html"
  blog.taglink = "blog/tag/{tag}/index.html"
  blog.year_link = "blog/year/{year}.html"
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
