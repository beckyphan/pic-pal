class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendees, class_name: "User"

  belongs_to :movie

  validates :user_id, uniqueness: { scope: :datetime, message: "you are already hosting another event at this date/time" }
end
