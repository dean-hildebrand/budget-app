class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :budgets, dependent: :destroy
  has_many :transactions, through: :budgets

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, uniqueness: true
  validates :password, length: { minimum: 8 }, on: :create
end
