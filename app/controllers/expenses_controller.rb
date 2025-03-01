class ExpensesController < ApplicationController
<<<<<<< HEAD
  layout "admin"

  def index
    @expenses = Expense.all
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to admin_expenses_path, notice: "Expense deleted successfully!"
=======
  before_action :authenticate_user!
  before_action :set_expense, only: %i[edit update destroy]
  layout "admin" # This will use layouts/admin.html.erb
  def index
    @expenses = current_user.expenses.order(date: :desc)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: "Expense added successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: "Expense updated."
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path, notice: "Expense deleted."
  end

  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:date, :amount, :description, :category, :image)
>>>>>>> 7916aad (Added login and sign up page)
  end
end
