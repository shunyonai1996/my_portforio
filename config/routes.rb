Rails.application.routes.draw do
  root    'microposts#index'
  get     '/',            to: 'microposts#index'
  get     'policy',       to: 'home#policy'
  get     'terms',        to: 'home#terms'
  # get     'post',         to: 'posts#new'
  get     'signup',       to: 'users#new'
  get     '/login',       to: 'sessions#new'
  post    '/login',       to: 'sessions#create'
  delete  '/logout',      to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :microposts, only: %i[index new create destroy]
end