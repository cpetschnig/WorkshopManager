class CreateWorkshops < ActiveRecord::Migration
  def self.up
    create_table :workshops do |t|
      t.string :name
      t.datetime :start_at
      t.integer :duration
      t.integer :room_id

      t.timestamps
    end
  end

  def self.down
    drop_table :workshops
  end
end
