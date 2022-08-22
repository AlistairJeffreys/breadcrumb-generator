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
      domain: url_split[2],
      page: url_split[3]
    }
  end

  def build_links url_sections, separator
    link_array = ['<a href="/">HOME</a>']
    if url_sections[:domain]
      domain = url_sections[:domain]
      link_array << "<a href=\"/#{domain}/\">#{domain.upcase}</a>"
    end
    if url_sections[:page]
      link_array << '<span class="active">ADASTRAL</span>'
    end
    link_array.join(separator)
  end

end