class Event < ActiveRecord::Base
  attr_accessible :event_end_date, :event_end_time, :event_start_date, :event_start_time, :location, :name
  belongs_to :organization

  scope :today, lambda { where(event_start_date: Time.zone.now.all_day).order('events.event_start_time ASC') }
  scope :tomorrow, lambda { where(event_start_date: 1.day.from_now.all_day).order('events.event_start_date, events.event_start_time ASC') }
  
  def self.this_week
    two_days = Time.now.beginning_of_day + 2.days
    one_week = Time.now.end_of_day + 7.days
    where('events.event_start_date >= ? AND events.event_start_date <= ?', two_days, one_week).order('events.event_start_date, events.event_start_time ASC')
  end
end
