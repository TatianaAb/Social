Rails.application.routes.draw do
  get 'friendships/index'
  get 'friendships/create'
  get 'friendships/update'
  get 'friendships/destroy'
  get 'sessions/index'
  get 'user/index'
  resources :user, only: [:new, :create, :show]
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
