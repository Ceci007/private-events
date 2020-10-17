Rails.application.routes.draw do
  resources :users
  resources :events
  root to: 'users#index'

  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
end
