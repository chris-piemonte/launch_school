class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

=begin

Alan created the above code to keep track of items for a shopping cart application he's writing.
Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.
Can you spot the mistake and how to address it?

on line 11 quantity needs to be @quantity or else it is trying to assign a new variable

=end
