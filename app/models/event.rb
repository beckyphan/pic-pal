class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendees, through: :guestlists
  has_many :guestlists, foreign_key: :event_id

  belongs_to :movie

  validates :host_id, uniqueness: { scope: :datetime, message: "you are already hosting another event at this date/time" }
end
