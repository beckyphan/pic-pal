class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
end

# need to build out comments
# event has_many comments
# user has_many comments
# comment belongs_to user
# comment belongs_to event
# validations: user can only comment on events if they are attending event 
