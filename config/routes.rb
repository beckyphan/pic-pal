Rails.application.routes.draw do
  resources :guestlists
  root to: "movies#home"
  resources :comments
  resources :events, only: [:index, :show, :destroy, :edit, :update]
  resources :movies
  resources :reviews
  resources :to_watches, only: [:create, :update]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show]

  resources :users, only: [:show] do
    resources :events, only: [:show]
  end

  resources :users, only: [:show] do
    resources :reviews, only: [:show]
  end

  resources :users, only: [:show] do
    resources :to_watches, only: [:show]
  end

  resources :movies, only: [:show] do
    resources :reviews, only: [:new]
  end

  resources :movies, only: [:show] do
    resources :events, only: [:new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#                                Prefix Verb     URI Pattern                                                                              Controller#Action
#                            guestlists GET      /guestlists(.:format)                                                                    guestlists#index
#                                       POST     /guestlists(.:format)                                                                    guestlists#create
#                         new_guestlist GET      /guestlists/new(.:format)                                                                guestlists#new
#                        edit_guestlist GET      /guestlists/:id/edit(.:format)                                                           guestlists#edit
#                             guestlist GET      /guestlists/:id(.:format)                                                                guestlists#show
#                                       PATCH    /guestlists/:id(.:format)                                                                guestlists#update
#                                       PUT      /guestlists/:id(.:format)                                                                guestlists#update
#                                       DELETE   /guestlists/:id(.:format)                                                                guestlists#destroy
#                                  root GET      /                                                                                        movies#home
#                              comments GET      /comments(.:format)                                                                      comments#index
#                                       POST     /comments(.:format)                                                                      comments#create
#                           new_comment GET      /comments/new(.:format)                                                                  comments#new
#                          edit_comment GET      /comments/:id/edit(.:format)                                                             comments#edit
#                               comment GET      /comments/:id(.:format)                                                                  comments#show
#                                       PATCH    /comments/:id(.:format)                                                                  comments#update
#                                       PUT      /comments/:id(.:format)                                                                  comments#update
#                                       DELETE   /comments/:id(.:format)                                                                  comments#destroy
#                                events GET      /events(.:format)                                                                        events#index
#                            edit_event GET      /events/:id/edit(.:format)                                                               events#edit
#                                 event GET      /events/:id(.:format)                                                                    events#show
#                                       PATCH    /events/:id(.:format)                                                                    events#update
#                                       PUT      /events/:id(.:format)                                                                    events#update
#                                       DELETE   /events/:id(.:format)                                                                    events#destroy
#                                movies GET      /movies(.:format)                                                                        movies#index
#                                       POST     /movies(.:format)                                                                        movies#create
#                             new_movie GET      /movies/new(.:format)                                                                    movies#new
#                            edit_movie GET      /movies/:id/edit(.:format)                                                               movies#edit
#                                 movie GET      /movies/:id(.:format)                                                                    movies#show
#                                       PATCH    /movies/:id(.:format)                                                                    movies#update
#                                       PUT      /movies/:id(.:format)                                                                    movies#update
#                                       DELETE   /movies/:id(.:format)                                                                    movies#destroy
#                               reviews GET      /reviews(.:format)                                                                       reviews#index
#                                       POST     /reviews(.:format)                                                                       reviews#create
#                            new_review GET      /reviews/new(.:format)                                                                   reviews#new
#                           edit_review GET      /reviews/:id/edit(.:format)                                                              reviews#edit
#                                review GET      /reviews/:id(.:format)                                                                   reviews#show
#                                       PATCH    /reviews/:id(.:format)                                                                   reviews#update
#                                       PUT      /reviews/:id(.:format)                                                                   reviews#update
#                                       DELETE   /reviews/:id(.:format)                                                                   reviews#destroy
#                            to_watches POST     /to_watches(.:format)                                                                    to_watches#create
#                              to_watch PATCH    /to_watches/:id(.:format)                                                                to_watches#update
#                                       PUT      /to_watches/:id(.:format)                                                                to_watches#update
#                      new_user_session GET      /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST     /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE   /users/sign_out(.:format)                                                                devise/sessions#destroy
# user_google_oauth2_omniauth_authorize GET|POST /users/auth/google_oauth2(.:format)                                                      users/omniauth_callbacks#passthru
#  user_google_oauth2_omniauth_callback GET|POST /users/auth/google_oauth2/callback(.:format)                                             users/omniauth_callbacks#google_oauth2
#                     new_user_password GET      /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET      /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH    /users/password(.:format)                                                                devise/passwords#update
#                                       PUT      /users/password(.:format)                                                                devise/passwords#update
#                                       POST     /users/password(.:format)                                                                devise/passwords#create
#              cancel_user_registration GET      /users/cancel(.:format)                                                                  devise/registrations#cancel
#                 new_user_registration GET      /users/sign_up(.:format)                                                                 devise/registrations#new
#                edit_user_registration GET      /users/edit(.:format)                                                                    devise/registrations#edit
#                     user_registration PATCH    /users(.:format)                                                                         devise/registrations#update
#                                       PUT      /users(.:format)                                                                         devise/registrations#update
#                                       DELETE   /users(.:format)                                                                         devise/registrations#destroy
#                                       POST     /users(.:format)                                                                         devise/registrations#create
#                                  user GET      /users/:id(.:format)                                                                     users#show
#                            user_event GET      /users/:user_id/events/:id(.:format)                                                     events#show
#                                       GET      /users/:id(.:format)                                                                     users#show
#                           user_review GET      /users/:user_id/reviews/:id(.:format)                                                    reviews#show
#                                       GET      /users/:id(.:format)                                                                     users#show
#                         user_to_watch GET      /users/:user_id/to_watches/:id(.:format)                                                 to_watches#show
#                                       GET      /users/:id(.:format)                                                                     users#show
#                      new_movie_review GET      /movies/:movie_id/reviews/new(.:format)                                                  reviews#new
#                                       GET      /movies/:id(.:format)                                                                    movies#show
#                       new_movie_event GET      /movies/:movie_id/events/new(.:format)                                                   events#new
#                                       GET      /movies/:id(.:format)                                                                    movies#show
