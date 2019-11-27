class Event < ActiveRecord::Base
    has_many :event_users, foreign_key: :event_id
    has_many :attendees, through: :event_users, source: :attendee
    belongs_to :host, class_name: "User"
  end

  class User < ActiveRecord::Base
    has_many :event_users, foreign_key: :attendee_id
    has_many :events, through: :event_users
    has_many :hosted_events, foreign_key: :host_id, class_name: "Event"
  end

  class EventUser < ActiveRecord::Base
    belongs_to :attendee, class_name: "User"
    belongs_to :event, class_name: "Event"
  end
