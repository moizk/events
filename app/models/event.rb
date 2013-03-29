class Event < ActiveRecord::Base
  attr_accessible :event_end_date, :event_end_time, :event_start_date, :event_start_time, :location, :name
  belongs_to :organization

  scope :today, lambda { where(event_start_date: Time.zone.now.all_day).order('events.event_start_time DESC') }
  scope :tomorrow, lambda { where(event_start_date: 1.day.from_now.all_day).order('events.event_start_date, events.event_start_time DESC') }
  scope :this_week, lambda { where(event_start_date: 3.day.from_now.all_week).order('events.event_start_date, events.event_start_time DESC') }
end
