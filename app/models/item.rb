class Item < ActiveRecord::Base
  attr_accessible :name, :num_onhand, :num_required, :unit
end
