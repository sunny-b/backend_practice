require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'tranaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(100)
    @transaction.amount_paid = 100
  end

  def test_accept_money
    assert_equal(@cash_register.total_money + @transaction.amount_paid, @cash_register.accept_money(@transaction))
  end

  def test_change
    assert_equal(@transaction.amount_paid - @transaction.item_cost, @cash_register.change(@transaction))
  end

  # def test_give_receipt
  #   skip
  #   assert_equal(nil, @cash_register.give_receipt(@transaction))
  #   assert_output(stdout = "You've paid $100.\n") { @cash_register.give_receipt(@transaction) }
  # end
end

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(100)
    input = StringIO.new('100')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal transaction.amount_paid, 100
  end
end
