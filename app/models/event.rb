class Event < ApplicationRecord
  belongs_to :host
  belongs_to :movie
end
