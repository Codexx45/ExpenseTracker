class AddUserToExpenses < ActiveRecord::Migration[8.0]
  def change
    add_reference :expenses, :user, null: false, foreign_key: true
  end
end
