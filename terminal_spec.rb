# terminal_spec.rb

require_relative 'terminal'

describe Terminal do
  context "with no product prices loaded" do
    term = Terminal.new

    it "has total of 0 for a new terminal" do
      expect(term.total).to eq(0)
    end

    it "stores new products by their code, price, bulk quantity, and bulk discount" do
      # Product A costs 2 dollars each or 4 for $7
      term.add_product('A',2,4,7)
      expect(term.get_products).to eql({'A' => [2,4,7]}) 
    end

    it "scans an item and adds the price to the total" do
      term.scan('A')
      expect(term.total).to eq(2)
    end

    it "deducts a bulk discount when the bulk quantity of an item has been reached" do
      term.scan('A')
      term.scan('A')
      term.scan('A')
      expect(term.total).to eq(7)
    end
  end
end
