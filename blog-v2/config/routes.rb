Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root "blogs#index"
  # root "posts#index"
  resources :users, except: [:show, :edit, :update]

  # UPDATE STATUS ROUTES to set USER as ADMIN
  get "/users/:id/status" => "users#status", as: :edit_status

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :blogs, only: [:index, :show]
  get "/about" => "blogs#about", as: :about

  # resources :posts
  resources :posts do
    resources :comments
    resources :favorites, only: [:create, :destroy, :index]
  end

  #SEARCH ROUTES
  # resources :search
  get "/search" => "search#index"
  # get "/search/:id" => "search#result", as: :search
  post "/search" => "search#index"

end
