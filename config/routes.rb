Rails.application.routes.draw do
  resources :roles
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }, skip: [:passwords]

  root to: 'posts#index'

  resources :posts, except: [:index]
  get 'accept' => 'posts#accept'
  get 'reject' => 'posts#reject'
  get 'books' => 'posts#books'
end
