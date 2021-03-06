Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[create destroy new]
  resources :tweets, only: %i[create index new]
  resources :followings, only: %i[create]
  resources :upvotes, only: %i[create]
  root to: 'sessions#new'
end
