class AddEndAtToWorkshop < ActiveRecord::Migration
  def self.up
    add_column :workshops, :end_at, :datetime

    Workshop.all.each do |workshop|
      if workshop[:start_at]
        # calculate :end_at out of :start_at and :duration
        workshop[:end_at] = workshop[:start_at] + (workshop[:duration] || 0).minutes
        workshop.save
      end
    end

    remove_column :workshops, :duration
  end

  def self.down
    add_column :workshops, :duration, :integer

    Workshop.all.each do |workshop|
      if workshop[:end_at] && workshop[:start_at]
        # calculate duration in minutes
        workshop[:duration] = (workshop[:end_at] - workshop[:start_at]) / 60
        workshop.save
      end
    end

    remove_column :workshops, :end_at
  end
end
