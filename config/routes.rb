Rails.application.routes.draw do
  root "static_pages#home"
  resources :users, only: [:new, :create, :show]
  resources :attractions
  get '/new', to: 'users#new'
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  get '/logout', to: 'session#destroy'
  post '/rides', to: 'rides#create'
end