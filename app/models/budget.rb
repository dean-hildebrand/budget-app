class Budget < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :user

  def formatted_month
    month.strftime("%B %Y")
  end

  # Summed in Ruby so an eager-loaded association (see BudgetsController#index)
  # is reused instead of firing a query per budget.
  def total_income
    transactions.select(&:income?).sum { |t| t.amount || 0 }
  end

  def total_expenses
    transactions.select(&:expense?).sum { |t| t.amount || 0 }
  end

  def remaining_balance
    total_income - total_expenses
  end
end
