require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
    @budget = @transaction.budget
    sign_in_as users(:one)
  end

  test "should get new" do
    get new_budget_transaction_url(@budget)
    assert_response :success
  end

  test "should create transaction" do
    assert_difference("Transaction.count") do
      post budget_transactions_url(@budget), params: { transaction: { amount: @transaction.amount, due_date: @transaction.due_date, name: @transaction.name, transaction_type: "expense", recurring: false } }
    end

    assert_redirected_to budget_url(@budget)
  end

  test "should get edit" do
    get edit_budget_transaction_url(@budget, @transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch budget_transaction_url(@budget, @transaction), params: { transaction: { amount: @transaction.amount, due_date: @transaction.due_date, name: @transaction.name, transaction_type: "income", recurring: true } }
    assert_redirected_to budget_url(@budget)
  end

  test "should destroy transaction" do
    assert_difference("Transaction.count", -1) do
      delete budget_transaction_url(@budget, @transaction)
    end

    assert_redirected_to budget_url(@budget)
  end

  test "should not edit a transaction from another budget" do
    get edit_budget_transaction_url(@budget, transactions(:two))
    assert_redirected_to budget_url(@budget)
  end
end
