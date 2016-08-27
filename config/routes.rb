Rails.application.routes.draw do
  root 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get     '/home',    to: 'pages#home'

  resources :users
  get '/orders', to: 'orders#show_all'
  resources :orders, only: [:new, :create] do
    get :search_client, on: :collection
    post :create_client, on: :collection
    post :add_repair, on: :collection
  end
  resources :clients do
    resources :orders, only: [:index, :show, :edit, :update, :destroy]
    get :repairs, on: :member
  end
  resources :repairs
  resources :component_descs
end
