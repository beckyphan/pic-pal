Rails.application.routes.draw do
  resources :guestlists
  root to: "movies#home"
  resources :comments
  resources :events
  resources :movies
  resources :reviews

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#                                Prefix Verb     URI Pattern                                                                              Controller#Action
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
#                                       POST     /events(.:format)                                                                        events#create
#                             new_event GET      /events/new(.:format)                                                                    events#new
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
#                                  user GET      /users/:id(.:format)                                                                     users#show
#                            user_event GET      /users/:user_id/events/:id(.:format)                                                     events#show
#                                       GET      /users/:id(.:format)                                                                     users#show
#                           user_review GET      /users/:user_id/reviews/:id(.:format)                                                    reviews#show
#                                       GET      /users/:id(.:format)                                                                     users#show
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
