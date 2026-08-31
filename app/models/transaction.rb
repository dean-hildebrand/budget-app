class Transaction < ApplicationRecord
  belongs_to :budget

  enum :transaction_type, [ :income, :expense ]
  normalizes :category, with: ->(it) { it.strip.titleize }

  scope :recurring, -> { where(recurring: true) }

  validates :name, :due_date, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_type, presence: true

  def self.types_for_select
    transaction_types.keys.map { |type| [ type.titleize, type ] }
  end

  def self.categories_for(user)
    user.transactions.pluck(:category).uniq.compact.sort
  end

  def formatted_due_date
    due_date.strftime("%b %d, %Y")
  end
end
