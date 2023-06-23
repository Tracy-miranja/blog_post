Rails.application.routes.draw do
  root to: "users#index"
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'posts', to: 'posts#index'
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end

