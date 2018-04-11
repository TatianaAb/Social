Rails.application.routes.draw do
  get 'user/index'
  resources :user, only: [:new, :create, :show]
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
