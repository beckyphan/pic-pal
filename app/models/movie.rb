class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :reviewers, through: :reviews
end
