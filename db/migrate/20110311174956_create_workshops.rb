class CreateWorkshops < ActiveRecord::Migration
  def self.up
    create_table :workshops do |t|
      t.string :name, :limit => 20
      t.datetime :start_at
      t.integer :duration
      t.integer :room_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :workshops
  end
end
