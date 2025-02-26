module Admin
  class DashboardController < ApplicationController
    layout "admin"

    def index
      @total_expenses = Expense.sum(:amount)
      @expenses_count = Expense.count
      @users_count = User.count
    end
  end
end