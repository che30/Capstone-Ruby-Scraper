class Scraper
  attr_reader :product
  attr_writer :url, :doc

  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(URI.parse(@url).open)
    @product = []
  end

  def scrape_block
    @doc.css('article.post-holder')
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
