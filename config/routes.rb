Rails.application.routes.draw do
  resources :attendances
  resources :events
  resources :users
  root to: 'users#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  get '/buy/:user_id/:event_id', to: 'attendances#buy'
end
