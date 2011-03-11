class Workshop < ActiveRecord::Base

  belongs_to :room

  validates :name, :length => {:maximum => 20, :minimum => 3}
  validates :room_id, :presence => true

end
