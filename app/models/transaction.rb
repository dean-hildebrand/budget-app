class Transaction < ApplicationRecord
  belongs_to :budget

  enum :transaction_type, [ :income, :expense ]

  def self.types_for_select
    transaction_types.keys.map { |type| [ type.titleize, type ] }
  end

  def formatted_due_date
    due_date.strftime("%b %d, %Y")
  end
end
