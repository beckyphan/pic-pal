class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :movie

  validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end

# potential feature: 'watched_list' scope being list of movies user has watched
# user may not post a review unless they have watched movies
