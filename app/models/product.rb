class Product

  def self.to_xml entries
    check_connection
    return if entries.length < 1
    builder = Nokogiri::XML::Builder.new { |xml|
      xml.products {
        entries.each { |entry|
          xml.product {
            xml.aid entry.id
            xml.name entry.title
            xml.desc CGI::escapeHTML(entry.description_html.nil? ? '' : entry.description_html.html_safe)
            xml.price entry.price
            xml.link entry.url
            xml.brand entry.vendor
            xml.shop_cat entry.category
            xml.image entry.featured_image_url
          }
        }
      }  
    }
    builder.to_xml
  end

  private

  def self.check_connection
    VersaConnection.check_connection
  end

end
