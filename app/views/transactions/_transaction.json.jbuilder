json.extract! transaction, :id, :budget_id, :name, :amount, :due_date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
