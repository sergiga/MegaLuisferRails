Rails.application.routes.draw do
  root 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get     '/home',    to: 'pages#home'

  resources :users
  resources :orders, only: [:new, :update, :create, :edit] do
    get :show_all, on: :collection
  end
  resources :clients do
    resources :orders, only: [:index, :show, :destroy]
    get :search, on: :collection
  end
  resources :repairs
  resources :component_descs
end
