Rails.application.routes.draw do
  root    'microposts#index'
  
  post '/users/guest_sign_in', to: 'users#guest_sign_in'
  
  get     '/',            to: 'microposts#index'
  get     'policy',       to: 'home#policy'
  get     'terms',        to: 'home#terms'
  get     'signup',       to: 'users#new'
  get     '/login',       to: 'sessions#new'
  get     'likes/create'
  get     'likes/destroy'
  post    '/login',       to: 'sessions#create'
  post    'set_occupations', to: 'occupations#set_occupations'
  delete  '/logout',      to: 'sessions#destroy'
  

  resources :users do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'bookmarklist' => 'bookmarks#bookmarklist', as: 'bookmarklist'
  end
 
  resources :account_activations, only: [:edit]
  resources :microposts, only: %i[index new create destroy search show] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
    collection do
      get :search
    end
  end
end