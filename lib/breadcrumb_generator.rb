require 'byebug'
class BreadcrumbGenerator

  def breadcrumb_function url, separator
    return unless url && separator

    build_links(split_url(url), separator)
  end

  private

  def split_url url
    url_split = url.split("/").reject { |p| p.empty? }
    {
      prefix: url_split[0],
      base_url: url_split[1],
      domain: url_split[2]
    }
  end

  def build_links url_sections, separator
    link_array = ['<a href="/">HOME</a>']
    if url_sections[:domain]
      link_array << '<a href="/SITES/">SITES</a>'
    end
    link_array.join(separator)
  end

end