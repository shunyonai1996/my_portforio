Rails.application.routes.draw do
  root    'home#top'
  get     '/',            to: 'home#top'
  get     'policy',       to: 'home#policy'
  get     'terms',        to: 'home#terms'
  get     'post',         to: 'posts#index'
  get     'comment',      to: 'posts#comment'
  get     'new',          to: 'posts#new'
  get     'signup',       to: 'users#new'
  get     '/login',       to: 'sessions#new'
  post    '/login',       to: 'sessions#create'
  delete  '/logout',      to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
end