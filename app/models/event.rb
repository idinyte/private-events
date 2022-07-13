class Event < ApplicationRecord
  belongs_to :event_creator, class_name: 'User', foreign_key: 'user_id'
  has_many :going_to_event
  has_many :attendees, through: :going_to_event, source: :user
end
