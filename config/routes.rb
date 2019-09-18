Rails.application.routes.draw do
  resources :roles
  devise_for :users, skip: [:passwords]

  root to: 'posts#index'

  resources :posts, except: [:index]
end
