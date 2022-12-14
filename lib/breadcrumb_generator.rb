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
      domains: domains,
      page: page
    }
  end

  def build_links url_sections, separator
    link_array = ['<a href="/">HOME</a>']
    page = url_sections[:page]
    domains = url_sections[:domains]
    if domains && !domains.empty?
      link_array << domain_links(domains)
    end
    if page && (page.split(".").first != "index")
      link_array << page_link(page)
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
      domain_to_display = domain_url_to_display_domain(domain)
      "<a href=\"/#{domain_path.join("/")}/\">#{domain_to_display}</a>"
    end
  end

  def domain_url_to_display_domain domain
    if domain.length > 20
      domain.split("-").map do |w| 
        w.chars.first if w.length > 2
      end.join("")
    else
      domain
    end.upcase
  end

  def page_link page
    "<span class=\"active\">#{page.split(".").first.upcase}</span>"
  end
end