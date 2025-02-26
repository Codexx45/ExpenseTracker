class ExpensesController < ApplicationController
  layout "admin"

  def index
    @expenses = Expense.all
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to admin_expenses_path, notice: "Expense deleted successfully!"
  end
end
