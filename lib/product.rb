class Product
  attr_reader :name, :address, :price

  def initialize(name, address, price)
    @name = name
    @address = address
    @price = price
  end
end
