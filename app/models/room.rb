class Room < ActiveRecord::Base

  has_many :workshops

  def available?(from, to, exclude_workshops = [])
    exclude_workshops = [exclude_workshops] unless exclude_workshops.is_a?(Array)   # convert last parameter to Array
    exclude_ids = exclude_workshops.map{|workshop| workshop.id}.compact
    exclude_ids = [-1] if exclude_ids.empty?

    Workshop.count(:conditions => ["room_id = ? AND start_at < ? AND end_at > ? AND id NOT IN (?)", self.id, to, from, exclude_ids]) == 0
  end
end
