# terminal_spec.rb

require_relative 'terminal'

describe Terminal, "#total" do
  it "returns 0 for total of a new terminal" do
    term = Terminal.new
    expect(term.total).to equal(0)
  end
end
    


#Scan these items in this order: ABCDABAA; Verify the total price is $32.40.
#Scan these items in this order: CCCCCCC; Verify the total price is $7.25.
#Scan these items in this order: ABCD; Verify the total price is $15.40.
