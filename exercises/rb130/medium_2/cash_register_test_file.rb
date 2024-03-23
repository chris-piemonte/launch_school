require 'minitest/autorun'
require_relative 'cash_register.rb'
require_relative 'transaction.rb'
require 'minitest/reporters'
Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(400)
  end

  def test_accept_money
    @transaction.amount_paid = 400
    assert_equal(1400, @cash_register.accept_money(@transaction))
  end

  def test_change
    @transaction.amount_paid = 500
    assert_equal(100, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") { @cash_register.give_receipt(@transaction) }
    assert_nil(@cash_register.give_receipt(@transaction))
  end
end
