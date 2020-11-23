# spec/product_spec.rb
require './bin/main'
describe Product do
  describe '#initialize' do
    it 'verifies that product class gets instantiated' do
      product = Product.new('iphone', 'bonamoussadi', '180000fcfa')
      expect(product).to an_instance_of(Product)
    end
    it 'raises argument error for wrong number of arguments' do
      expect { Product.new('iphone', 'bonamoussadi', '180000fcfa', 'a') }.to raise_error(ArgumentError)
    end
  end
end
