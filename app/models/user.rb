class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :guestlists, foreign_key: :attendee_id
  has_many :hosted_events, foreign_key: :host_id, class_name: "Event"
  has_many :attended_events, through: :guestlist, source: :event

  has_many :movie_reviews, foreign_key: :review_id, class_name: "Review"
  has_many :reviewed_movies, through: :reviews, source: :movies

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
end
