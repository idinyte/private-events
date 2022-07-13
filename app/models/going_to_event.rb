class GoingToEvent < ApplicationRecord
  validates :user, uniqueness: { scope: :event }
  belongs_to :user
  belongs_to :event
end
