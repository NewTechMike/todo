Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/create'
  get 'tasks/update'
  get 'tasks/destroy'
  resources :users
  resources :lists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/hello', to: 'application#hello_world'
  get '/users/:user_id/lists', to: 'list#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
