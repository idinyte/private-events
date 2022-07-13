class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true

  has_many :events, inverse_of: :event_creator
  has_many :going_to_event
  has_many :attended_events, through: :going_to_event, source: :event
end
