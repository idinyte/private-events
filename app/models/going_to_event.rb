class GoingToEvent < ApplicationRecord
  validates :user, uniqueness: true
  belongs_to :user
  belongs_to :event
end
