# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  unit         :string(255)
#  num_required :integer
#  num_onhand   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  location     :string(255)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
