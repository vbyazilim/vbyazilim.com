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
  
  def is_active(href)
    ' class="is-active"' if href == current_page.url
  end
  
  def copy_to_clipboard(title, url, lang='en')
    clipboard_url = "https://vbyazilim.com/training/##{url}"
    clipboard_url = "https://vbyazilim.com/tr/egitimler/##{url}" if lang == "tr"
    link_title = "Copy #{title} url to clipboard for share"
    link_title = "#{title} linkini paylaşmak için kopyala" if lang == "tr"

    out = []
    out << "<a title=\"#{link_title}\" class=\"copy-clipboard\" data-url=\"#{clipboard_url}\">"
    out << title
    out << '<span class="icon"><i class="fas fa-clipboard"></i></span>'
    out << '</a>'
    out.join
  end
end
