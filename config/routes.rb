Rails.application.routes.draw do
  root 'home#top'
  get '/', to: 'home#top'
  get 'policy', to: 'home#policy'
  get 'terms', to: 'home#terms'
  get 'post', to: 'posts#index'
  get 'comment', to: 'posts#comment'
  get 'new', to: 'posts#new'
  get 'signup', to: 'users#new'

  resources :users
end