require "rubygems"
require "bundler"
Bundler.require

require "time"

task :default => [:runserver]

ARTICLE_FILE_DATE_FORMAT = "%Y-%m-%d"
ARTICLE_POST_DATE_FORMAT = "%b %d, %Y %H:%M"

NOW = Time.now.strftime(ARTICLE_FILE_DATE_FORMAT)

desc "Run development server"
task :runserver do
  system "bundle exec middleman serve"
end

namespace :new do
  # rake new:article["hello world uğur","2016 june 20"]
  # rake new:article["Do you know how write Django code ?","Jun 6 2019 10:30"]
  desc "Post new Article"
  task :article, [:title, :date] do |t, args|
    
    article_title = args.title ? args.title : "new-article"
    article_date = args.date ? Time.parse(args.date) : Time.now

    article_file = "source/blog/#{article_date.strftime(ARTICLE_FILE_DATE_FORMAT)}-#{article_title.to_url}.html.markdown.erb"

    output = []
    output << "---"
    output << "title: \"#{article_title}\""
    output << "date: #{article_date.strftime(ARTICLE_POST_DATE_FORMAT)}"
    output << "# category: news"
    output << "# tags: tag1,tag2"
    output << "author: \"Uğur Özyılmazel\""
    output << "opengraph_image: \"#{article_date.strftime(ARTICLE_FILE_DATE_FORMAT)}-og-IMAGE.jpg\""
    output << "# published: false"
    output << "---"
    output << ""
    output << "Article summary..."
    output << "READ_MORE"
    output << ""

    File.write article_file, output.join("\n")
    puts "Blog post is ready to cook: #{article_file}"
  end
end

desc "Deploy to gh-pages with bump"
task :deploy, [:bump] do |_, args|
  args.with_defaults(bump: 'patch')

  now = Time.now.strftime("%Y-%m-%d-%H-%M")
  system %{
    cd build/ &&
    git pull &&
    cd ../ &&
    bumpversion #{args.bump} &&
    git push &&
    bundle exec middleman build --clean --verbose &&
    cd build/ &&
    git add . &&
    git commit -m "release #{now}" &&
    git push &&
    cd ../
  }
  puts "Deployed..."
end


desc "Build site"
task :build do
  system "bundle exec middleman build --clean --verbose"
end
