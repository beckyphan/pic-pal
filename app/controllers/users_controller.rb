class UsersController < ApplicationController
  has_many :hosted_events, through: :events
  has_many :attended_events, through: :events
  has_many :reviews
  has_many :reviewed_movies, through: :reviews
end
