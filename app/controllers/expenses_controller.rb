class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: [:edit, :update, :destroy]

  def index
     @expenses = Expense.order("date DESC").where(user: current_user)
     # if params[:concept].present?
     #  @expenses = @expenses.where("concept LIKE ?","%#{params[:concept]}%")
     # end
     # if params[:category_id].present?
     #  @expenses = @expenses.where("category_id = ?",params[:category_id])
     # end

     # Esta se usa para separar las consultas del Controlador y dejarlas en el Model que especifica la DB
     @expenses = @expenses.search_by_concept(params).search_by_category(params)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      redirect_to expenses_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path
    else
      render :edit
    end
  end

  def destroy
    if @expense.destroy
      redirect_to expenses_path
    else
      render expenses_path
    end
  end

  private
  def expense_params
    params.require(:expense).permit(:concept,:amount,:date,:category_id)
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end
end
