class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :event_start_date
      t.datetime :event_end_date
      t.datetime :event_start_time
      t.datetime :event_end_time

      t.timestamps
    end
  end
end
