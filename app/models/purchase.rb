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

class Purchase < ActiveRecord::Base
  attr_accessible :item_id, :purchased, :quantity
  
  belongs_to :item

  def self.update_purchase_list
  	# For Each found item in shopping list, update the quantity on hand in the Items list
  	# then delete found items
    list = self.purchased
    list.each do |l|
    	an_item = l.item 
    	puts l.quantity,an_item.num_onhand
    	an_item.num_onhand += l.quantity
    	an_item.save
    	q_update = an_item.num_required-an_item.num_onhand
    	if q_update <= 0
    	  l.destroy
    	else
    	  l.update_attributes(quantity: q_update)	
          l.update_attributes(purchased: :false)
    	end
    end
  	
  	# get the list of items that should be on list  http://stackoverflow.com/questions/4156616/return-array-of-ids
  	puts "Here:"
  	list = self.not_purchased
  	if list.count>0
  	  ids_to_exclude = list.select(:item_id).collect(&:item_id)
  	  items_table = Arel::Table.new(:items) 
  	  array_without = Item.items_needed.where(items_table[:id].not_in ids_to_exclude)
  	else
  	  array_without = Item.items_needed
  	end
    array_without.each do |l|
    	self.create(item_id: l.id, quantity: l.num_required-l.num_onhand, purchased: :false)
    end

  end

  scope :purchased, where("purchased=?",:true)
  scope :not_purchased, where("purchased=?",:false)
end
