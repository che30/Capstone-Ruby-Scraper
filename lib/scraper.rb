# rubocop: disable Security/Open
class Scraper
  attr_accessor :url, :element, :product, :doc
  attr_writer :name

  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(URI.open(@url))
    @product = []
  end

  def scrape_block
    @doc.css('article.post-holder')
  end

  def scrape_block_elemet_total
    @doc.css('article.post-holder').count
  end

  def scrape
    scrape_block.map do |e|
      name = e.css('a.post-link').text.split.join('')
      address = e.css('span.address').text.split.join('').to_s
      price = e.css('span.price').text.split.join('')
      prod = Product.new(name, address, price)
      @product << prod
    end
    @product
  end
end
# rubocop: enable Security/Open
