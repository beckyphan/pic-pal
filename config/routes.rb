Rails.application.routes.draw do
  get 'movie/index'
  get 'movie/home'
  get 'movie/edit'
  get 'movie/update'
  get 'movie/create'
  get 'movie/show'
  get 'movie/delete'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "movies#home"
end
