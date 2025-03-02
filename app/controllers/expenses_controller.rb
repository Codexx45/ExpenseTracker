class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[edit update destroy]
  layout "admin" # This will use layouts/admin.html.erb

  def index
    @expenses = current_user.expenses.order(date: :desc) # Corrected line
    @recent_expenses = current_user.expenses.order(date: :desc).limit(10) # Corrected line
    @page_title = "All Expenses" # Set the page title
  
    # Apply filters if parameters are present
    apply_filters
  
    # Debugging: Print the expenses and recent expenses
    puts "Expenses: #{@expenses.inspect}"
    puts "Recent Expenses: #{@recent_expenses.inspect}"
  end

  def show
    @expense = Expense.find(params[:id])
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
    respond_to do |format|  # Fix: Use `do |format|` instead of `do [format]`
      format.html { redirect_to expenses_path, notice: 'Expense was successfully deleted.' }
      format.js   # Correct: This looks for `destroy.js.erb`, not `.json`
    end
  end

  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :category, :date, :description)  # Add :description here
  end

  def apply_filters
    if params[:start_date].present?
      @expenses = @expenses.where("date >= ?", params[:start_date])
      puts "Filtered by start_date: #{params[:start_date]}"  # Debugging: Print the applied filter
    end

    if params[:end_date].present?
      @expenses = @expenses.where("date <= ?", params[:end_date])
      puts "Filtered by end_date: #{params[:end_date]}"  # Debugging: Print the applied filter
    end

    if params[:category].present? && params[:category] != "All Categories"
      @expenses = @expenses.where(category: params[:category])
      puts "Filtered by category: #{params[:category]}"  # Debugging: Print the applied filter
    end

    if params[:amount].present?
      @expenses = @expenses.where("amount <= ?", params[:amount])
      puts "Filtered by amount: #{params[:amount]}"  # Debugging: Print the applied filter
    end
  end
end