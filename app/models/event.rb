class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  belongs_to :movie
end
