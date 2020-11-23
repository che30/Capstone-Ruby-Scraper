class Product
  attr_accessor :name, :address, :price
  def initialize(name, address, price)
    @name = name
    @address = address
    @price = price
  end
end
