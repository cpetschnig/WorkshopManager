class Workshop < ActiveRecord::Base

  belongs_to :room

  validates :name, :length => {:maximum => 20, :minimum => 3}
  validates :room_id, :presence => true

  def end_at
    return unless self[:start_at]
    self[:start_at] + (self[:duration] || 0).minutes
  end

end
