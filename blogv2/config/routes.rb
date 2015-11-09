Rails.application.routes.draw do
  # resources :posts

  root "home#index"
  get "/" => "home#index"
  get "/about" => "home#about"

  resources :users, only: [:new, :create]

  resources :blogs, only: [:index, :show] do
    resources :comments
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  # resources :codes do
  #   resources :snippets, only: [:show, :destroy]
  # end

  # get "/blogs" => "home#blogs"
  # get "/blogs/:id" => "home#view", as: :view_blog

  #POST ROUTES
  resources :posts
  # get "/posts" => "posts#index"
  # post "/posts" => "posts#create"
  # get "/posts/new" => "posts#new", as: :new_post
  # get "/posts/:id/edit" => "posts#edit", as: :edit_post
  # get "/posts/:id" => "posts#show", as: :post
  # patch "/posts/:id" => "posts#update"
  # delete "/posts/:id" => "posts#destroy"

  #COMMENT ROUTES
  resources :comments, only: [:index, :create]
  # get "/comments" => "comments#index"
  # post "/comments" => "comments#create"

  #SEARCH ROUTES
  # resources :search
  get "/search" => "search#index"
  # get "/search/:id" => "search#result", as: :search
  post "/search" => "search#index"

end
