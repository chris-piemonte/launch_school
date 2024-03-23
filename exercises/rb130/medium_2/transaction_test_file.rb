require 'minitest/autorun'
require_relative 'transaction.rb'
require_relative 'cash_register.rb'
# require 'minitest/reporters'
# Minitest::Reporters.use!

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(1000)
  end

  def test_prompt_for_payment
    input = StringIO.new("1000\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(1000, @transaction.amount_paid)
  end
end
