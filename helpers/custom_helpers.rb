module CustomHelpers
  def pluralize(count, singular, plural)
    return plural if count > 1
    return singular
  end

  def image(file, **options)
    zoomable_class = " #{options[zoomable_class]}" || ""
    img_class = " class=\"#{options[:img_class]}\"" || ""
    alt = options[:alt] || "Image"
    caption = options[:caption] || nil

    out = []
    out << "<div class=\"zoomable#{zoomable_class}\">"
    out << "<figure class=\"image\">"
    out << "<img#{img_class} src=\"/public/images/blog/#{file}\" alt=\"#{alt}\" />"
    out << "<figcaption>#{caption}</figcaption>" if caption
    out << "</figure>"
    out << "</div>"
    
    out.join
  end
end
