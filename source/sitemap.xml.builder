xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  site_url = "https://vbyazilim.com/"
  just_catgories = blog.articles.map{|a| a.metadata[:page][:category]}.uniq

  xml.url do
    xml.loc "#{site_url}"
    xml.lastmod Time.now.xmlschema
  end
  xml.url do
    xml.loc "#{site_url}blog/"
    xml.lastmod Time.now.xmlschema
  end
  xml.url do
    xml.loc "#{site_url}services/"
    xml.lastmod Time.now.xmlschema
  end
  xml.url do
    xml.loc "#{site_url}training/"
    xml.lastmod Time.now.xmlschema
  end
  
  blog.articles.each do |article|
    article.tags.each do |tag|
      xml.url do
        xml.loc "#{site_url}blog/tag/#{tag}/"
        xml.lastmod File.mtime(article.source_file).xmlschema
      end
    end
  end

  just_catgories.each do |category|
    xml.url do
      xml.loc "#{site_url}blog/category/#{category}/"
      xml.lastmod Time.now.xmlschema
    end
  end
end
