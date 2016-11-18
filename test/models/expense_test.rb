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

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
