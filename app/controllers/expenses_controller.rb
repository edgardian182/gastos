class ExpensesController < ApplicationController
  def index
     @expenses = Expense.order("date DESC")
     # if params[:concept].present?
     #  @expenses = @expenses.where("concept LIKE ?","%#{params[:concept]}%")
     # end
     # if params[:category_id].present?
     #  @expenses = @expenses.where("category_id = ?",params[:category_id])
     # end

     # Esta se usa para separar las consultas del Controlador y dejarlas en el Model que especifica la DB
     @expenses = @expenses.search_by_concept(params).search_by_category(params)
  end
end