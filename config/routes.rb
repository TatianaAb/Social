Rails.application.routes.draw do
  get '/users/search', to: 'users#search', as: 'search'
  resources :users, only: [:new, :create, :show] do
    resources :friendships, only: [:index, :create, :destroy, :update]
  end
  resources :sessions, only: [:new, :destroy]


  get '/sessions/login', to: 'sessions#login', as: 'login'
  post '/sessions/login', to: 'sessions#create'
  get '/sessions/logout', to: 'sessions#destroy', as: "logout"
  get '/posts/new', to: "posts#new"
  get '/posts/:id/edit', to: "posts#edit"
  delete '/posts/:id', to: "posts#destroy", as: "delete_post"
  put 'posts/:id', to: 'posts#update'
  post '/users/:id/posts', to: "posts#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
