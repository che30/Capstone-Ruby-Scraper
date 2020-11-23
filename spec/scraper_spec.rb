# spec/scraper_spec.rb
require './bin/main'
describe Scraper do
  let(:scraper) { Scraper.new('https://www.jumia.cm/en/mobile-phones?page2') }
  describe '#initialize' do
    it 'verifies if scraper gets instantiated ' do
      expect(scraper).to an_instance_of(Scraper)
    end
    it 'raises an argument error for wrong number of arguments ' do
      expect do
        Scraper.new('https://www.jumia.cm/en/mobile-phones?page',
                    'https://www.jumia.cm/en/mobile-phones?page')
      end.to raise_error(ArgumentError)
    end
  end
  describe '#scrape_block' do
    it 'verifies if scraper_block return the appropiate type' do
      expect(scraper.scrape_block.class).to eql(Nokogiri::XML::NodeSet)
    end
    it 'throws an error if an argument is given' do
      expect { scraper.scrape_block('1') }.to raise_error(ArgumentError)
    end
  end
  describe '#scrape' do
    it 'verifies if scrape block returns an array' do
      expect(scraper.scrape).to an_instance_of(Array)
    end
    it ' verifies if the return type fails for floats' do
      expect(scraper.scrape).not_to an_instance_of(Float)
    end
  end
end
