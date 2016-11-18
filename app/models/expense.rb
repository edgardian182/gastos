class Expense < ActiveRecord::Base
  belongs_to :category

  scope :search_by_concept, -> (params) {where("concept LIKE ?", "%#{params[:concept]}%") if params[:concept].present?}

  scope :search_by_category, -> (params) {where("category_id = ?", params[:category_id]) if params[:category_id].present?}
end
