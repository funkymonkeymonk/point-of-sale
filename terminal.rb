# terminal.rb

class Terminal
  # Positional Constants for product array
  PRICE = 0
  BULK_QUANTITY = 1
  BULK_DISCOUNT = 2

  def initialize()
    @products = {}
    @cart = []
  end

  def total
    subtotal, discount = 0, 0

    # Calculate total of cart
    subtotal = @cart.reduce(0) do |sum, code|
      sum + @products[code][PRICE]
    end
    # Calculate discount
    discount = @products.keys.reduce(0) do |sum, code|
      sum + (@cart.count(code) / @products[code][BULK_QUANTITY]) * @products[code][BULK_DISCOUNT]
    end

    subtotal - discount
  end

  def add_product(code, price, bulk_quantity = 1, bulk_discount = price)
    # Not certain if I should leave each product as an array or if I should make
    # this it's own very simple class
    @products[code] = [price, bulk_quantity, price * bulk_quantity - bulk_discount]
  end

  def get_products
    @products
  end

  def scan(code)
    @cart << code
  end

  def to_s
    "products:#@products, cart:#@cart"
  end

  def set_pricing(new_products)
    @products.clear
    new_products.each {|key, value| add_product(key, *value)}
  end
end