budget = Budget.find_or_create_by!(name: "Monthly Budget", month: Date.today.beginning_of_month)

[
  { transaction_type: :income, name: "Salary", amount: 5000, due_date: budget.month + 5.days },
  { transaction_type: :expense, name: "Rent", amount: 1500, due_date: budget.month + 1.day },
  { transaction_type: :expense, name: "Groceries", amount: 300, due_date: budget.month + 10.days },
  { transaction_type: :expense, name: "Utilities", amount: 200, due_date: budget.month + 15.days }
]
.each do |transaction_attrs|
  budget.transactions.find_or_create_by!(transaction_attrs)
end
