Rails.application.routes.draw do
  root 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get     '/home',    to: 'pages#home'

  resources :users
  get '/bills', to: 'bills#show_all'
  resources :clients do
    resources :bills
    get :repairs, on: :member
  end
  resources :repairs do
    get :search_client, on: :collection
  end
end
