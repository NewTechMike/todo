Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/create'
  get 'tasks/update'
  get 'tasks/destroy'
  resources :users
  resources :lists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/hello', to: "application#hello_world"
  get ':user_id/lists', to: 'lists#index'

  get ':user_id/:list_id/tasks', to: "tasks#index"

  get '/me', to: "users#show"
  patch '/me', to: "users#update"
  post '/me', to: "users#update"

  post '/signup', to: 'users#create'
  
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
