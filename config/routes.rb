Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "users#index"

  resources :users, only: [ :index, :show] do 
    resources :posts, only: [:index, :show, :new] do 
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
    # resources :posts, only: [:create]
    post "users/:user_id/posts", to: "posts#create", as: :user_create_post
  end

  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  # get 'posts', to: 'posts#index'
  # resources :users
  # resources :posts
  # resources :comments
  # resources :likes 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end

