# app/models/event.rb
 class Post < ActiveRecord::Base
   has_many :eventlists, foreign_key: :event_id
   has_many :attendees, through: :eventlists, source: :attendee_id
   belongs_to :host, class_name: "User"
 end

 # app/models/user.rb
 class User < ActiveRecord::Base
   has_many :eventlists, foreign_key: :host_id
   has_many :attended_events, through: :eventlists, source: :event_id
   has_many :hosted_events, foreign_key: :host_id, class_name: "Event"
 end

 # app/models/eventlist.rb
 class PostAuthoring < ActiveRecord::Base
   belongs_to :host, class_name: "User"
   belongs_to :event, class_name: "Event"
 end
