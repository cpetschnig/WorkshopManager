class Workshop < ActiveRecord::Base

  belongs_to :room

  validates :name, :length => {:maximum => 20, :minimum => 3}
  validates :room_id, :presence => true

  validate :room_availability_validation

  def duration
    (((self[:end_at] || self[:start_at] || Time.new) - (self[:start_at] || Time.new)) / 60).to_i
  end

  def room_availability_validation
    errors.add(:base, I18n.translate('errors.room_booked')) unless room.available?(self.start_at, self.end_at, self)
  end

end
