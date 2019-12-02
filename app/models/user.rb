class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :hosted_events, foreign_key: :host_id, class_name: "Event"
  has_many :guestlists, foreign_key: :user_id
  has_many :attended_events, through: :guestlists, source: :event

  has_many :movie_reviews, foreign_key: :review_id, class_name: "Review"
  has_many :reviewed_movies, through: :movie_reviews, source: :movie

  has_many :to_watches
  has_many :movies_in_to_watches, through: :to_watches, source: :movie

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end

  def movies_watched
    current_user.to_watches.where(watched: true)
  end

  def movies_to_watch
    current_user.to_watches.where(watched: false)
  end 
end
