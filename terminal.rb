# terminal.rb

class Terminal
  def initialize()
    # Positional Constants for product array
    @PRICE = 0
    @BULK_QUANTITY = 1
    @BULK_DISCOUNT = 2

    @products = {}
    @cart = []
  end

  def total
    @cart.reduce(0) do |sum, code|
      sum + @products[code][@PRICE]
    end

  end

  def add_product(code, price, bulk_quantity, bulk_discount)
    # Not certain if I should leave each product as an array or if I should make
    # this it's own very simple class
    @products[code] = [price, bulk_quantity, price * bulk_quantity - bulk_discount]
  end

  def get_products()
    @products
  end

  def scan(code)
    @cart << code
  end
end