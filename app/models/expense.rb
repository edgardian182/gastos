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

  validates_presence_of :concept, :amount, :date, :category_id, :user_id
  validates_numericality_of :amount


  scope :search_by_concept, -> (params) {where("concept LIKE ?", "%#{params[:concept]}%") if params[:concept].present?}

  scope :search_by_category, -> (params) {where("category_id = ?", params[:category_id]) if params[:category_id].present?}
end
