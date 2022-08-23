require 'byebug'
class BreadcrumbGenerator

  def breadcrumb_function url, separator
    return unless url && separator

    build_links(split_url(url), separator)
  end

  private

  def split_url url
    url_split = url.split("/").reject { |p| p.empty? }
    page = url_has_page(url_split) ? url_split.last : nil
    domains = page ? url_split[2..-2] : url_split[2..]
    {
      prefix: url_split[0],
      base_url: url_split[1],
      domains: domains,
      page: page
    }
  end

  def build_links url_sections, separator
    link_array = ['<a href="/">HOME</a>']
    domains = url_sections[:domains]
    if domains && !domains.empty?
      link_array << domain_links(domains)
    end
    if url_sections[:page]
      link_array << "<span class=\"active\">#{url_sections[:page].split(".").first.upcase}</span>"
    end
    link_array.join(separator)
  end

  def url_has_page url_split
    url_split.size > 2 && url_split.last.include?(".")
  end

  def domain_links domains
    domain_path = []
    domains.map do |domain|
      domain_path << domain
      "<a href=\"/#{domain_path.join("/")}/\">#{domain.upcase}</a>"
    end
  end
end