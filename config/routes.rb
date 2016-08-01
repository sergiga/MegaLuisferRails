Rails.application.routes.draw do
  root   'sessions#new'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/login',   to: 'sessions#destroy'

  resources :users
end
