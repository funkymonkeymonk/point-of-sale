# terminal_spec.rb

require_relative 'terminal'

describe Terminal do
  context "with no product prices loaded" do
    term = Terminal.new

    it "has total of 0 for a new terminal." do
      expect(term.total).to eq(0)
    end

    it "stores new products by their code, price, bulk quantity, and bulk discount." do
      # Product A costs 2 dollars each or 4 for $7
      term.add_product('A',2,4,7)
      expect(term.get_products).to eql({'A' => [2,4,1]}) 
    end

    it "scans an item and adds the price to the total." do
      term.scan('A')
      expect(term.total).to eq(2)
    end

    it "deducts bulk discounts when the bulk quantity of an item has been reached." do
      10.times { term.scan('A') }
      expect(term.total).to eq(20)
    end

    it "stores new products with no bulk discounts." do
      term.add_product('B',12)
      expect(term.get_products).to eql({'A' => [2,4,1], 'B' => [12,1,0]})
    end

    it "can accept a hash of pricing data." do
      products = {'A' => [2,4,1], 'B' => [12,1,0], 'C' => [1.25,6,6], 'D' => [0.15,1,0]}
      term.set_pricing(products)
      expect(term.get_products).to eql({'A' => [2,4,1], 'B' => [12,1,0], 'C' => [1.25,6,6], 'D' => [0.15,1,0]})
    end
  end
end
