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
#  location_id  :integer
#

class Item < ActiveRecord::Base
  attr_accessible :name, :num_onhand, :num_required, :unit, :location_id
  belongs_to :location
  
end
