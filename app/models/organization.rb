class Organization < ActiveRecord::Base
  attr_accessible :description, :name, :website
  has_many :events
end
