class Event < ActiveRecord::Base
  attr_accessible :event_end_date, :event_end_time, :event_start_date, :event_start_time, :location, :name
  belongs_to :organization
end
