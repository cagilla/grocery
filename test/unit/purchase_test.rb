# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  quantity   :integer
#  purchased  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
