# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  category_id :integer
#  date        :date
#  concept     :string
#  amount      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :category


  scope :search_by_concept, -> (params) {where("concept LIKE ?", "%#{params[:concept]}%") if params[:concept].present?}

  scope :search_by_category, -> (params) {where("category_id = ?", params[:category_id]) if params[:category_id].present?}
end
