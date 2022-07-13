class Event < ApplicationRecord
  belongs_to :event_creator, class_name: 'User', foreign_key: 'user_id'
  has_many :going_to_event
  has_many :attendees, through: :going_to_event, source: :user

  validates :description, presence: true, length: 30..2000
  validates :title, presence: true, length: {maximum: 30}
  validates :date, presence: true, comparison: { greater_than: Time.now, message: "must be in the future" }
end
