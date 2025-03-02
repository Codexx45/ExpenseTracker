class Expense < ApplicationRecord
  # Ensure this line is present
  belongs_to :user

  # Add validations if needed
  validates :amount, :category, :date, presence: true
end