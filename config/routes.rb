Rails.application.routes.draw do
  resources :events
  resources :attendances
  root to: 'users#index'

  get 'signup', to: 'users#new' 
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/buy/:user_id/:event_id', to: 'attendances#buy'
end
