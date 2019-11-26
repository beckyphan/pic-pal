class Movie < ApplicationRecord
  has_many :reviews
  has_many :events
  has_many :reviewers, through: :reviews
end
