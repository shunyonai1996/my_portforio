Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root    'microposts#index'
  get     '/',            to: 'microposts#index'
  get     'policy',       to: 'home#policy'
  get     'terms',        to: 'home#terms'
  get     'signup',       to: 'users#new'
  get     '/login',       to: 'sessions#new'
  post    '/login',       to: 'sessions#create'
  delete  '/logout',      to: 'sessions#destroy'


  resources :users
  resources :account_activations, only: [:edit]
  resources :microposts, only: %i[index new create destroy search show] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    collection do
      get :search
    end
  end
end