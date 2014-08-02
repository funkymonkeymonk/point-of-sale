# terminal.rb

class Terminal
  def initialize()
    @products = {}
    @total = 0
  end

  def total
    @total
  end

  def add_product(code, price, bulk_quantity, bulk_discount)
    @products[code] = [price, bulk_quantity, bulk_discount]
  end

  def get_products()
    @products
  end
end