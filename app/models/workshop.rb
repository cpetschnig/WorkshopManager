class Workshop < ActiveRecord::Base

  validates :name, :length => {:maximum => 20, :minimum => 3}
  validates :room_id, :presence => true

end
