# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  attr_accessible :name
  has_many :items

  def self.list_location_options 
    Location.select("id, name").map {|x| [x.id, x.name] }
  end


end
